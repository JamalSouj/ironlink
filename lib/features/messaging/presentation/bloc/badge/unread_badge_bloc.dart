import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/features/messaging/domain/usecases/watch_unread_count.dart';
import 'package:ironlink/features/messaging/presentation/bloc/badge/unread_badge_event.dart';
import 'package:ironlink/features/messaging/presentation/bloc/badge/unread_badge_state.dart';

@injectable
class UnreadBadgeBloc extends Bloc<UnreadBadgeEvent, UnreadBadgeState> {
  UnreadBadgeBloc(this._watchUnreadCount) : super(const UnreadBadgeState()) {
    on<UnreadBadgeEvent>((event, emit) async {
      switch (event) {
        case UnreadBadgeStarted(:final currentUserId):
          await _onStarted(currentUserId, emit);
      }
    });
  }

  final WatchUnreadCount _watchUnreadCount;

  Future<void> _onStarted(
    String currentUserId,
    Emitter<UnreadBadgeState> emit,
  ) async {
    await emit.forEach(
      _watchUnreadCount(currentUserId),
      onData: (either) => either.fold(
        (_) => state, // Ignore errors silently for badges
        (count) => UnreadBadgeState(count: count),
      ),
      onError: (_, _) => state,
    );
  }
}
