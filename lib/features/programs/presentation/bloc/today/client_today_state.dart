import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/programs/domain/entities/workout_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_today_state.freezed.dart';

@freezed
sealed class ClientTodayState with _$ClientTodayState {
  const factory ClientTodayState.initial() = ClientTodayInitial;
  const factory ClientTodayState.loading() = ClientTodayLoading;
  const factory ClientTodayState.loaded({required WorkoutSession? session}) =
      ClientTodayLoaded;
  const factory ClientTodayState.error({required Failure failure}) =
      ClientTodayError;
}
