import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/features/exercises/data/datasources/exercise_remote_datasource.dart';
import 'package:ironlink/features/exercises/data/models/exercise_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

@LazySingleton(as: ExerciseRemoteDataSource)
class SupabaseExerciseRemoteDataSource implements ExerciseRemoteDataSource {
  const SupabaseExerciseRemoteDataSource(this._client);
  final sb.SupabaseClient _client;

  @override
  Future<List<ExerciseModel>> getExercises() async {
    try {
      final user = _client.auth.currentUser;
      if (user == null) {
        throw const ServerException(message: 'User not logged in');
      }

      final data = await _client
          .from('exercises')
          .select()
          .or('created_by.eq.${user.id},created_by.is.null')
          .order('name');

      return (data as List)
          .map((json) => ExerciseModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Failed to fetch exercises: $e');
    }
  }

  @override
  Future<ExerciseModel> addExercise(ExerciseModel exercise) async {
    try {
      final user = _client.auth.currentUser;
      if (user == null) {
        throw const ServerException(message: 'User not logged in');
      }

      final data = await _client.from('exercises').insert({
        'name': exercise.name,
        'category': exercise.category,
        'demo_video_url': exercise.demoVideoUrl,
        'created_by': user.id,
      }).select().single();

      return ExerciseModel.fromJson(data);
    } catch (e) {
      throw ServerException(message: 'Failed to add exercise: $e');
    }
  }
}
