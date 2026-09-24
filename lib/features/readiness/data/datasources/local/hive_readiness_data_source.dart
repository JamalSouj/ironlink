import 'dart:convert';
import 'package:ironlink/features/readiness/data/models/readiness_log_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveReadinessDataSource {
  static const String _boxName = 'readiness_queue';

  Future<Box<String>> get _box async {
    if (!Hive.isBoxOpen(_boxName)) {
      return Hive.openBox<String>(_boxName);
    }
    return Hive.box<String>(_boxName);
  }

  Future<void> queueReadinessSubmission(ReadinessLogModel log) async {
    final box = await _box;
    await box.put(log.id, jsonEncode(log.toJson()));
  }

  Future<List<ReadinessLogModel>> getQueuedSubmissions() async {
    final box = await _box;
    return box.values.map((jsonStr) {
      return ReadinessLogModel.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
    }).toList();
  }

  Future<void> removeQueuedSubmission(String id) async {
    final box = await _box;
    await box.delete(id);
  }
}
