import 'package:ironlink/features/programs/domain/entities/set_log.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_log_model.freezed.dart';
part 'set_log_model.g.dart';

@freezed
abstract class SetLogModel with _$SetLogModel {
  const SetLogModel._();

  const factory SetLogModel({
    required String id,
    required String workoutSessionId,
    required String exerciseId,
    required int setOrder,
    int? prescribedReps,
    double? prescribedLoadKg,
    double? prescribedPct1Rm,
    int? actualReps,
    double? actualLoadKg,
    double? actualRpe,
    String? tempo,
    DateTime? completedAt,
  }) = _SetLogModel;

  factory SetLogModel.fromJson(Map<String, dynamic> json) =>
      _$SetLogModelFromJson(json);

  SetLog toDomain() => SetLog(
    id: id,
    workoutSessionId: workoutSessionId,
    exerciseId: exerciseId,
    setOrder: setOrder,
    prescribedReps: prescribedReps,
    prescribedLoadKg: prescribedLoadKg,
    prescribedPct1Rm: prescribedPct1Rm,
    actualReps: actualReps,
    actualLoadKg: actualLoadKg,
    actualRpe: actualRpe,
    tempo: tempo,
    completedAt: completedAt,
  );

  static SetLogModel fromDomain(SetLog entity) => SetLogModel(
    id: entity.id,
    workoutSessionId: entity.workoutSessionId,
    exerciseId: entity.exerciseId,
    setOrder: entity.setOrder,
    prescribedReps: entity.prescribedReps,
    prescribedLoadKg: entity.prescribedLoadKg,
    prescribedPct1Rm: entity.prescribedPct1Rm,
    actualReps: entity.actualReps,
    actualLoadKg: entity.actualLoadKg,
    actualRpe: entity.actualRpe,
    tempo: entity.tempo,
    completedAt: entity.completedAt,
  );
}
