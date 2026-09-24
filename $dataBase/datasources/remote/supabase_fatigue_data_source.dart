import 'package:ascent/core/error/exceptions.dart';
import 'package:ascent/features/fatigue/domain/entities/training_load_point.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:rxdart/rxdart.dart';

@lazySingleton
class SupabaseFatigueDataSource {
  const SupabaseFatigueDataSource(this._client);
  final sb.SupabaseClient _client;

  Stream<List<TrainingLoadPoint>> watchClientFatigueData(String clientId) {
    // We combine streams from workout_sessions and readiness_logs
    final sessionsStream = _client
        .from('workout_sessions')
        .stream(primaryKey: ['id'])
        .eq('client_id', clientId)
        .eq('status', 'completed');

    final readinessStream = _client
        .from('readiness_logs')
        .stream(primaryKey: ['id'])
        .eq('client_id', clientId);

    return Rx.combineLatest2(sessionsStream, readinessStream, (
      List<Map<String, dynamic>> sessions,
      List<Map<String, dynamic>> readiness,
    ) {
      // 1. Group by date
      final dateMap = <String, Map<String, dynamic>>{};

      for (final r in readiness) {
        final date = r['log_date'] as String;
        dateMap[date] = {'readiness': r, 'sessions': []};
      }

      for (final s in sessions) {
        final date = s['scheduled_date'] as String;
        if (!dateMap.containsKey(date)) {
          dateMap[date] = {'readiness': null, 'sessions': []};
        }
        (dateMap[date]!['sessions'] as List).add(s);
      }

      final sortedDates = dateMap.keys.toList()..sort();
      final points = <TrainingLoadPoint>[];

      // We will compute acute/chronic loads progressively.
      // This is a naive local calculation, normally done via a rolling DB query or an RPC.
      final historicalLoads = <String, double>{};

      for (final d in sortedDates) {
        final dateObj = DateTime.parse(d);
        final entry = dateMap[d]!;

        final sessionList = entry['sessions'] as List;
        double dailyLoad = 0;
        int? rpe;
        int? duration;

        if (sessionList.isNotEmpty) {
          // Average or sum session load
          for (final s in sessionList) {
            final sRpe = s['session_rpe'] as int? ?? 0;
            final sDur = s['duration_minutes'] as int? ?? 0;
            dailyLoad += sRpe * sDur;
            rpe = sRpe;
            duration = sDur;
          }
        }

        historicalLoads[d] = dailyLoad;

        // Calculate Acute (7 days) and Chronic (28 days) loads
        double acuteSum = 0;
        double chronicSum = 0;

        for (int i = 0; i < 28; i++) {
          final targetDate = dateObj.subtract(Duration(days: i));
          final targetStr = targetDate.toIso8601String().split('T').first;
          final loadAtTarget = historicalLoads[targetStr] ?? 0;

          chronicSum += loadAtTarget;
          if (i < 7) {
            acuteSum += loadAtTarget;
          }
        }

        final acuteAvg = acuteSum / 7;
        final chronicAvg = chronicSum / 28;
        final acwr = chronicAvg == 0 ? 0.0 : acuteAvg / chronicAvg;

        final rData = entry['readiness'];
        points.add(
          TrainingLoadPoint(
            date: dateObj,
            sessionRpe: rpe,
            durationMinutes: duration,
            dailyLoad: dailyLoad,
            acuteLoad: acuteAvg,
            chronicLoad: chronicAvg,
            acwr: acwr,
            sleepQuality: rData != null ? rData['sleep_quality'] as int? : null,
            soreness: rData != null ? rData['soreness'] as int? : null,
            stress: rData != null ? rData['stress'] as int? : null,
          ),
        );
      }

      return points;
    });
  }
}
