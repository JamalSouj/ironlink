import 'package:ascent/features/readiness/domain/entities/readiness_log.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'readiness_log_model.freezed.dart';
part 'readiness_log_model.g.dart';

@freezed
abstract class ReadinessLogModel with _$ReadinessLogModel {
  const ReadinessLogModel._();

  const factory ReadinessLogModel({
    required String id,
    required String clientId,
    required DateTime logDate,
    required int sleepQuality,
    required int soreness,
    required int stress,
    required double readinessScore,
  }) = _ReadinessLogModel;

  factory ReadinessLogModel.fromJson(Map<String, dynamic> json) => _$ReadinessLogModelFromJson(json);

  ReadinessLog toDomain() => ReadinessLog(
        id: id,
        clientId: clientId,
        logDate: logDate,
        sleepQuality: sleepQuality,
        soreness: soreness,
        stress: stress,
        readinessScore: readinessScore,
      );

  static ReadinessLogModel fromDomain(ReadinessLog entity) => ReadinessLogModel(
        id: entity.id,
        clientId: entity.clientId,
        logDate: entity.logDate,
        sleepQuality: entity.sleepQuality,
        soreness: entity.soreness,
        stress: entity.stress,
        readinessScore: entity.readinessScore,
      );
}
