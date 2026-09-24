import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_builder_event.freezed.dart';

@freezed
sealed class ProgramBuilderEvent with _$ProgramBuilderEvent {
  const factory ProgramBuilderEvent.started({required String programId}) =
      ProgramBuilderStarted;
  const factory ProgramBuilderEvent.addBlock({
    required String name,
    required int blockOrder,
    String? focus,
  }) = ProgramBuilderAddBlock;
  const factory ProgramBuilderEvent.scheduleSession({
    required String blockId,
    required String clientId,
    required DateTime date,
  }) = ProgramBuilderScheduleSession;
  const factory ProgramBuilderEvent.duplicateWeek({
    required String blockId,
    required DateTime sourceStart,
    required DateTime targetStart,
  }) = ProgramBuilderDuplicateWeek;
}
