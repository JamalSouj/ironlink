import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class SyncDelegate {
  Future<void> flushQueue();
}

@singleton
class SyncService {
  SyncService() {
    _init();
  }

  final List<SyncDelegate> _delegates = [];
  bool _isOnline = true;

  Future<void> _init() async {
    await Hive.initFlutter();

    // Check initial status
    final result = await Connectivity().checkConnectivity();
    _updateOnlineStatus(result);

    // Listen for changes
    Connectivity().onConnectivityChanged.listen(_updateOnlineStatus);
  }

  void _updateOnlineStatus(List<ConnectivityResult> results) {
    // If the list of results contains none, we are offline
    final isOnlineNow = !results.contains(ConnectivityResult.none);

    if (!_isOnline && isOnlineNow) {
      _isOnline = true;
      _flushAll();
    } else {
      _isOnline = isOnlineNow;
    }
  }

  void registerDelegate(SyncDelegate delegate) {
    _delegates.add(delegate);
    if (_isOnline) {
      delegate.flushQueue();
    }
  }

  Future<void> _flushAll() async {
    for (final delegate in _delegates) {
      try {
        await delegate.flushQueue();
      } catch (e) {
        // Log or handle individual delegate failure
      }
    }
  }

  bool get isOnline => _isOnline;
}
