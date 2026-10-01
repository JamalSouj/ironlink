import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/features/programs/data/models/program_block_model.dart';
import 'package:ironlink/features/programs/data/models/program_model.dart';
import 'package:ironlink/features/programs/data/models/set_log_model.dart';
import 'package:ironlink/features/programs/data/models/workout_session_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:uuid/uuid.dart';

@lazySingleton
class SupabaseProgramsDataSource {
  const SupabaseProgramsDataSource(this._client);
  final sb.SupabaseClient _client;

  Future<ProgramModel> createProgram(
    String coachId,
    String clientId,
    String name,
    DateTime startDate,
    DateTime? endDate,
  ) async {
    try {
      final id = const Uuid().v4();
      final data = await _client
          .from('programs')
          .insert({
            'id': id,
            'coach_id': coachId,
            'client_id': clientId,
            'name': name,
            'start_date': startDate.toIso8601String().split('T').first,
            if (endDate != null)
              'end_date': endDate.toIso8601String().split('T').first,
          })
          .select()
          .single();
      return ProgramModel.fromJson(data);
    } catch (e) {
      throw ServerException(message: 'Failed to create program: $e');
    }
  }

  Future<ProgramBlockModel> addProgramBlock(
    String programId,
    String name,
    int blockOrder,
    String? focus,
  ) async {
    try {
      final id = const Uuid().v4();
      final data = await _client
          .from('program_blocks')
          .insert({
            'id': id,
            'program_id': programId,
            'name': name,
            'block_order': blockOrder,
            'focus': ?focus,
          })
          .select()
          .single();
      return ProgramBlockModel.fromJson(data);
    } catch (e) {
      throw ServerException(message: 'Failed to add block: $e');
    }
  }

  Future<WorkoutSessionModel> scheduleWorkoutSession(
    String programBlockId,
    String clientId,
    DateTime scheduledDate,
  ) async {
    try {
      final id = const Uuid().v4();
      final data = await _client
          .from('workout_sessions')
          .insert({
            'id': id,
            'program_block_id': programBlockId,
            'client_id': clientId,
            'scheduled_date': scheduledDate.toIso8601String().split('T').first,
            'status': 'scheduled',
          })
          .select()
          .single();
      return WorkoutSessionModel.fromJson(data);
    } catch (e) {
      throw ServerException(message: 'Failed to schedule session: $e');
    }
  }

  Future<SetLogModel> addSetLog(
    String workoutSessionId,
    String exerciseId,
    int setOrder,
    int? prescribedReps,
    double? prescribedLoadKg,
    double? prescribedPct1Rm,
    String? tempo,
  ) async {
    try {
      final id = const Uuid().v4();
      final data = await _client
          .from('set_logs')
          .insert({
            'id': id,
            'workout_session_id': workoutSessionId,
            'exercise_id': exerciseId,
            'set_order': setOrder,
            'prescribed_reps': ?prescribedReps,
            'prescribed_load_kg': ?prescribedLoadKg,
            'prescribed_pct_1rm': ?prescribedPct1Rm,
            'tempo': ?tempo,
          })
          .select()
          .single();
      return SetLogModel.fromJson(data);
    } catch (e) {
      throw ServerException(message: 'Failed to add set log: $e');
    }
  }

  Future<void> duplicateBlock(String blockId, int newBlockOrder) async {
    // Basic duplication logic (would be more robust with an RPC in production)
    throw UnimplementedError(
      'duplicateBlock not fully implemented without RPC',
    );
  }

  Future<void> duplicateWeek(
    String blockId,
    DateTime sourceWeekStart,
    DateTime targetWeekStart,
  ) async {
    // We would select sessions in the block matching the week, and insert them with offset dates
    try {
      // 1. Fetch source sessions
      final sourceEnd = sourceWeekStart.add(const Duration(days: 6));
      final sessions = await _client
          .from('workout_sessions')
          .select('*, set_logs(*)')
          .eq('program_block_id', blockId)
          .gte(
            'scheduled_date',
            sourceWeekStart.toIso8601String().split('T').first,
          )
          .lte('scheduled_date', sourceEnd.toIso8601String().split('T').first);

      final diff = targetWeekStart.difference(sourceWeekStart).inDays;

      for (var s in sessions) {
        final oldDate = DateTime.parse(s['scheduled_date'] as String);
        final newDate = oldDate.add(Duration(days: diff));
        final newSessionId = const Uuid().v4();

        await _client.from('workout_sessions').insert({
          'id': newSessionId,
          'program_block_id': blockId,
          'client_id': s['client_id'],
          'scheduled_date': newDate.toIso8601String().split('T').first,
          'status': 'scheduled',
        });

        final setLogs = s['set_logs'] as List;
        if (setLogs.isNotEmpty) {
          final newSets = setLogs
              .map(
                (log) => {
                  'id': const Uuid().v4(),
                  'workout_session_id': newSessionId,
                  'exercise_id': log['exercise_id'],
                  'set_order': log['set_order'],
                  'prescribed_reps': log['prescribed_reps'],
                  'prescribed_load_kg': log['prescribed_load_kg'],
                  'prescribed_pct_1rm': log['prescribed_pct_1rm'],
                  'tempo': log['tempo'],
                },
              )
              .toList();
          await _client.from('set_logs').insert(newSets);
        }
      }
    } catch (e) {
      throw ServerException(message: 'Failed to duplicate week: $e');
    }
  }

  Stream<List<ProgramModel>> watchClientPrograms(String clientId) {
    return _client
        .from('programs')
        .stream(primaryKey: ['id'])
        .eq('client_id', clientId)
        .map(
          (data) => data.map((json) => ProgramModel.fromJson(json)).toList(),
        );
  }

  Stream<List<ProgramBlockModel>> watchProgramBlocks(String programId) {
    return _client
        .from('program_blocks')
        .stream(primaryKey: ['id'])
        .eq('program_id', programId)
        .order('block_order', ascending: true)
        .map(
          (data) =>
              data.map((json) => ProgramBlockModel.fromJson(json)).toList(),
        );
  }

  Stream<List<WorkoutSessionModel>> watchUpcomingSessions(
    String clientId,
    DateTime fromDate,
  ) {
    return _client
        .from('workout_sessions')
        .stream(primaryKey: ['id'])
        .eq('client_id', clientId)
        .gte('scheduled_date', fromDate.toIso8601String().split('T').first)
        .map(
          (data) =>
              data.map((json) => WorkoutSessionModel.fromJson(json)).toList(),
        );
  }

  Stream<WorkoutSessionModel?> watchTodaySession(String clientId) {
    final today = DateTime.now().toIso8601String().split('T').first;
    // stream returns List, we take the first matching or null
    return _client
        .from('workout_sessions')
        .stream(primaryKey: ['id'])
        .eq('client_id', clientId)
        .eq('scheduled_date', today)
        .map(
          (data) =>
              data.isEmpty ? null : WorkoutSessionModel.fromJson(data.first),
        );
  }

  Future<void> logSet(SetLogModel log) async {
    try {
      await _client.from('set_logs').upsert(log.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<void> completeSession(String sessionId, int rpe, int duration) async {
    try {
      await _client
          .from('workout_sessions')
          .update({
            'status': 'completed',
            'session_rpe': rpe,
            'duration_minutes': duration,
          })
          .eq('id', sessionId);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
