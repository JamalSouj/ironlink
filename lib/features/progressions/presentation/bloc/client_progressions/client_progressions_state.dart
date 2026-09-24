import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/progressions/domain/entities/client_progression_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_progressions_state.freezed.dart';

@freezed
sealed class ClientProgressionsState with _$ClientProgressionsState {
  const factory ClientProgressionsState.initial() = ClientProgressionsInitial;
  const factory ClientProgressionsState.loading() = ClientProgressionsLoading;
  const factory ClientProgressionsState.loaded(
    List<ClientProgressionStatus> progressions,
  ) = ClientProgressionsLoaded;
  const factory ClientProgressionsState.error(Failure failure) =
      ClientProgressionsError;
}
