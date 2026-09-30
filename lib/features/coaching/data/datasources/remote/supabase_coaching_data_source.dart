import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/features/coaching/data/models/client_summary_model.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

@lazySingleton
class SupabaseCoachingDataSource {
  const SupabaseCoachingDataSource(this._client);

  final sb.SupabaseClient _client;

  Stream<List<ClientSummary>> watchMyClients(String coachId) {
    // Watch coach_clients for changes. AsyncMap to fetch full join data.
    return _client
        .from('coach_clients')
        .stream(primaryKey: ['id'])
        .eq('coach_id', coachId)
        .eq('status', 'active')
        .asyncMap((_) async {
          try {
            final data = await _client
                .from('profiles')
                .select('''
              *,
              coach_clients!inner(*),
              programs(name),
              readiness_logs(readiness_score)
            ''')
                .eq('coach_clients.coach_id', coachId)
                .eq('coach_clients.status', 'active');

            return (data as List)
                .map(
                  (json) =>
                      ClientSummaryModel.fromJson(json as Map<String, dynamic>),
                )
                .toList();
          } catch (e) {
            throw ServerException(message: 'Failed to fetch clients: $e');
          }
        });
  }

  Future<String> generateInviteCode(String coachId) async {
    try {
      // Very simple invite code generator, e.g. 6 chars
      final inviteCode = List.generate(6, (_) => 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'[Random().nextInt(36)]).join();

      await _client.from('coach_invites').insert({
        'coach_id': coachId,
        'invite_code': inviteCode,
        'status': 'active',
      });
      return inviteCode;
    } catch (e) {
      throw ServerException(message: 'Failed to generate invite code: $e');
    }
  }

  Future<int> getClientCount(String coachId) async {
    try {
      final response = await _client
          .from('coach_clients')
          .select('id')
          .eq('coach_id', coachId)
          .eq('status', 'active')
          .count();
      return response.count;
    } catch (e) {
      throw ServerException(message: 'Failed to get client count: $e');
    }
  }
}
