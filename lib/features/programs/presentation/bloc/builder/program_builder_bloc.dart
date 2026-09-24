import 'package:ascent/features/programs/domain/usecases/add_program_block.dart';
import 'package:ascent/features/programs/domain/usecases/duplicate_week.dart';
import 'package:ascent/features/programs/domain/usecases/schedule_workout_session.dart';
import 'package:ascent/features/programs/domain/usecases/watch_program_blocks.dart';
import 'package:ascent/features/programs/presentation/bloc/builder/program_builder_event.dart';
import 'package:ascent/features/programs/presentation/bloc/builder/program_builder_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ascent/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProgramBuilderBloc
    extends Bloc<ProgramBuilderEvent, ProgramBuilderState> {
  ProgramBuilderBloc(
    this._watchProgramBlocks,
    this._addProgramBlock,
    this._scheduleSession,
    this._duplicateWeek,
  ) : super(const ProgramBuilderState.initial()) {
    on<ProgramBuilderEvent>((event, emit) async {
      await switch (event) {
        ProgramBuilderStarted(:final programId) => _onStarted(programId, emit),
        ProgramBuilderAddBlock(:final name, :final blockOrder, :final focus) =>
          _onAddBlock(name, blockOrder, focus, emit),
        ProgramBuilderScheduleSession(:final blockId, :final clientId, :final date) =>
          _onScheduleSession(blockId, clientId, date, emit),
        ProgramBuilderDuplicateWeek(:final blockId, :final sourceStart, :final targetStart) =>
          _onDuplicateWeek(blockId, sourceStart, targetStart, emit),
      };
    });
  }

  final WatchProgramBlocks _watchProgramBlocks;
  final AddProgramBlock _addProgramBlock;
  final ScheduleWorkoutSession _scheduleSession;
  final DuplicateWeek _duplicateWeek;

  String? _programId;

  Future<void> _onStarted(
    String programId,
    Emitter<ProgramBuilderState> emit,
  ) async {
    _programId = programId;
    emit(const ProgramBuilderState.loading());
    await emit.forEach(
      _watchProgramBlocks(programId),
      onData: (either) => either.fold(
        (f) => ProgramBuilderState.error(failure: f),
        (blocks) => ProgramBuilderState.loaded(blocks: blocks),
      ),
      onError: (dynamic error, _) => const ProgramBuilderState.error(
        failure: ServerFailure(message: 'Failed to stream program blocks'),
      ),
    );
  }

  Future<void> _onAddBlock(
    String name,
    int blockOrder,
    String? focus,
    Emitter<ProgramBuilderState> emit,
  ) async {
    if (_programId == null) return;
    await _addProgramBlock(
      AddProgramBlockParams(
        programId: _programId!,
        name: name,
        blockOrder: blockOrder,
        focus: focus,
      ),
    );
  }

  Future<void> _onScheduleSession(
    String blockId,
    String clientId,
    DateTime date,
    Emitter<ProgramBuilderState> emit,
  ) async {
    await _scheduleSession(
      ScheduleWorkoutSessionParams(
        programBlockId: blockId,
        clientId: clientId,
        scheduledDate: date,
      ),
    );
  }

  Future<void> _onDuplicateWeek(
    String blockId,
    DateTime sourceStart,
    DateTime targetStart,
    Emitter<ProgramBuilderState> emit,
  ) async {
    await _duplicateWeek(
      DuplicateWeekParams(
        blockId: blockId,
        sourceWeekStart: sourceStart,
        targetWeekStart: targetStart,
      ),
    );
  }
}
