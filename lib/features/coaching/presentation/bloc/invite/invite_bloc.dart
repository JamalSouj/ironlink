import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/coaching/domain/usecases/generate_invite_code.dart';
import 'package:ironlink/features/coaching/presentation/bloc/invite/invite_event.dart';
import 'package:ironlink/features/coaching/presentation/bloc/invite/invite_state.dart';

@injectable
class InviteBloc extends Bloc<InviteEvent, InviteState> {
  InviteBloc(this._generateInviteCode, this._authBloc)
    : super(const InviteState.initial()) {
    on<InviteGeneratePressed>(_onGeneratePressed);
  }

  final GenerateInviteCode _generateInviteCode;
  final AuthBloc _authBloc;

  Future<void> _onGeneratePressed(
    InviteGeneratePressed event,
    Emitter<InviteState> emit,
  ) async {
    emit(const InviteState.generating());
    final authState = _authBloc.state;
    final coachId = switch (authState) {
      AuthenticatedCoach(:final user) => user.id,
      _ => null,
    };
    if (coachId == null) {
      emit(
        const InviteState.error(
          ServerFailure(message: 'Not logged in as a coach'),
        ),
      );
      return;
    }

    final result = await _generateInviteCode(coachId);
    result.fold(
      (failure) => emit(InviteState.error(failure)),
      (code) => emit(InviteState.generated(code)),
    );
  }
}
