import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/features/progressions/domain/entities/client_progression_status.dart';

part 'client_progression_status_model.freezed.dart';
part 'client_progression_status_model.g.dart';

@freezed
abstract class ClientProgressionStatusModel
    with _$ClientProgressionStatusModel {
  const ClientProgressionStatusModel._();

  const factory ClientProgressionStatusModel({
    required String id,
    required String clientId,
    required String progressionId,
    String? currentLevelId,
    DateTime? unlockedAt,
  }) = _ClientProgressionStatusModel;

  factory ClientProgressionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ClientProgressionStatusModelFromJson(json);

  ClientProgressionStatus toDomain() => ClientProgressionStatus(
    id: id,
    clientId: clientId,
    progressionId: progressionId,
    currentLevelId: currentLevelId,
    unlockedAt: unlockedAt,
  );

  static ClientProgressionStatusModel fromDomain(
    ClientProgressionStatus entity,
  ) => ClientProgressionStatusModel(
    id: entity.id,
    clientId: entity.clientId,
    progressionId: entity.progressionId,
    currentLevelId: entity.currentLevelId,
    unlockedAt: entity.unlockedAt,
  );
}
