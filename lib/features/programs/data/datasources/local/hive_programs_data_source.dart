import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/features/programs/data/models/set_log_model.dart';

@lazySingleton
class HiveProgramsDataSource {
  static const String _setsBoxName = 'sets_queue';
  static const String _sessionsBoxName = 'sessions_queue';

  Future<Box<String>> get _setsBox async {
    if (!Hive.isBoxOpen(_setsBoxName)) {
      return Hive.openBox<String>(_setsBoxName);
    }
    return Hive.box<String>(_setsBoxName);
  }

  Future<Box<String>> get _sessionsBox async {
    if (!Hive.isBoxOpen(_sessionsBoxName)) {
      return Hive.openBox<String>(_sessionsBoxName);
    }
    return Hive.box<String>(_sessionsBoxName);
  }

  // --- SETS ---
  Future<void> queueSetLog(SetLogModel log) async {
    final box = await _setsBox;
    await box.put(log.id, jsonEncode(log.toJson()));
  }

  Future<List<SetLogModel>> getQueuedSets() async {
    final box = await _setsBox;
    return box.values.map((jsonStr) {
      return SetLogModel.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
    }).toList();
  }

  Future<void> removeQueuedSet(String id) async {
    final box = await _setsBox;
    await box.delete(id);
  }

  // --- SESSIONS ---
  Future<void> queueSessionCompletion(String sessionId, int rpe, int duration) async {
    final box = await _sessionsBox;
    await box.put(sessionId, jsonEncode({'id': sessionId, 'rpe': rpe, 'duration': duration}));
  }

  Future<List<Map<String, dynamic>>> getQueuedSessions() async {
    final box = await _sessionsBox;
    return box.values.map((jsonStr) => jsonDecode(jsonStr) as Map<String, dynamic>).toList();
  }

  Future<void> removeQueuedSession(String id) async {
    final box = await _sessionsBox;
    await box.delete(id);
  }
}
