import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/features/readiness/data/models/readiness_log_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

@lazySingleton
class SupabaseReadinessDataSource {
  const SupabaseReadinessDataSource(this._client);
  final sb.SupabaseClient _client;

  Future<void> submitReadiness(ReadinessLogModel log) async {
    try {
      await _client.from('readiness_logs').upsert(log.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<ReadinessLogModel?> checkTodayReadiness(String clientId) async {
    try {
      final today = DateTime.now().toIso8601String().split('T').first;
      final result = await _client
          .from('readiness_logs')
          .select()
          .eq('client_id', clientId)
          .eq('log_date', today)
          .maybeSingle();
      
      if (result == null) return null;
      return ReadinessLogModel.fromJson(result);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
