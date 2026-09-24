import 'package:ascent/core/error/exceptions.dart';
import 'package:ascent/features/progressions/data/models/client_progression_status_model.dart';
import 'package:ascent/features/progressions/data/models/progression_level_model.dart';
import 'package:ascent/features/progressions/data/models/progression_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:uuid/uuid.dart';

@lazySingleton
class SupabaseProgressionsDataSource {
  const SupabaseProgressionsDataSource(this._client);

  final sb.SupabaseClient _client;

  Stream<List<ProgressionModel>> watchCoachProgressions(String coachId) {
    return _client
        .from('progressions')
        .stream(primaryKey: ['id'])
        .eq('created_by', coachId)
        .map(
          (data) =>
              data.map((json) => ProgressionModel.fromJson(json)).toList(),
        );
  }

  Stream<List<ProgressionLevelModel>> watchProgressionLevels(
    String progressionId,
  ) {
    return _client
        .from('progression_levels')
        .stream(primaryKey: ['id'])
        .eq('progression_id', progressionId)
        .order('level_order', ascending: true)
        .map(
          (data) =>
              data.map((json) => ProgressionLevelModel.fromJson(json)).toList(),
        );
  }

  Future<ProgressionModel> createProgression(
    String name,
    String coachId,
  ) async {
    try {
      final id = const Uuid().v4();
      final data = await _client
          .from('progressions')
          .insert({'id': id, 'name': name, 'created_by': coachId})
          .select()
          .single();
      return ProgressionModel.fromJson(data);
    } catch (e) {
      throw ServerException(message: 'Failed to create progression: $e');
    }
  }

  Future<ProgressionLevelModel> addProgressionLevel({
    required String progressionId,
    required String exerciseId,
    required int levelOrder,
    required Map<String, dynamic> unlockCriteria,
  }) async {
    try {
      final id = const Uuid().v4();
      final data = await _client
          .from('progression_levels')
          .insert({
            'id': id,
            'progression_id': progressionId,
            'exercise_id': exerciseId,
            'level_order': levelOrder,
            'unlock_criteria': unlockCriteria,
          })
          .select()
          .single();
      return ProgressionLevelModel.fromJson(data);
    } catch (e) {
      throw ServerException(message: 'Failed to add level: $e');
    }
  }

  Future<void> reorderProgressionLevels(
    List<Map<String, dynamic>> updates,
  ) async {
    try {
      // Supabase dart client upsert can take a list to update multiple rows.
      // But upsert needs the full row, or at least the primary key + fields to update.
      // Since it's just id and level_order, we might need an RPC, or we can update in a loop.
      // For a small number of levels, loop is fine.
      for (final update in updates) {
        await _client
            .from('progression_levels')
            .update({'level_order': update['level_order'] as Object})
            .eq('id', update['id'] as Object);
      }
    } catch (e) {
      throw ServerException(message: 'Failed to reorder levels: $e');
    }
  }

  Stream<List<ClientProgressionStatusModel>> watchClientProgressions(
    String clientId,
  ) {
    return _client
        .from('client_progression_status')
        .stream(primaryKey: ['id'])
        .eq('client_id', clientId)
        .map(
          (data) => data
              .map((json) => ClientProgressionStatusModel.fromJson(json))
              .toList(),
        );
  }

  Future<void> overrideClientProgressionLevel({
    required String clientId,
    required String progressionId,
    required String levelId,
  }) async {
    try {
      // Upsert client progression status
      // We don't have the id of the status row readily available if it doesn't exist,
      // so we use a match on clientId and progressionId, but Supabase dart update doesn't upsert seamlessly without the PK.
      // We can query first or use an upsert with onConflict.
      // Wait, client_progression_status has unique constraint on (client_id, progression_id)?
      // Let's check the schema. Let's just assume it does or we update where exists.
      final existing = await _client
          .from('client_progression_status')
          .select('id')
          .eq('client_id', clientId)
          .eq('progression_id', progressionId)
          .maybeSingle();

      if (existing != null) {
        await _client
            .from('client_progression_status')
            .update({
              'current_level_id': levelId,
              'unlocked_at': DateTime.now().toIso8601String(),
            })
            .eq('id', existing['id'] as String);
      } else {
        final newId = const Uuid().v4();
        await _client.from('client_progression_status').insert({
          'id': newId,
          'client_id': clientId,
          'progression_id': progressionId,
          'current_level_id': levelId,
          'unlocked_at': DateTime.now().toIso8601String(),
        });
      }
    } catch (e) {
      throw ServerException(message: 'Failed to override level: $e');
    }
  }
}
