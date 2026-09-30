import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';

part 'roster_state.freezed.dart';

@freezed
sealed class RosterState with _$RosterState {
  const factory RosterState.initial() = RosterInitial;
  const factory RosterState.loading() = RosterLoading;
  const factory RosterState.loaded(List<ClientSummary> clients) = RosterLoaded;
  const factory RosterState.error(Failure failure) = RosterError;
}
