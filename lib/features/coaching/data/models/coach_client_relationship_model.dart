import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/features/coaching/domain/entities/coach_client_relationship.dart';

part 'coach_client_relationship_model.freezed.dart';
part 'coach_client_relationship_model.g.dart';

@freezed
abstract class CoachClientRelationshipModel
    with _$CoachClientRelationshipModel {
  const CoachClientRelationshipModel._();

  const factory CoachClientRelationshipModel({
    required String id,
    required String coachId,
    required String clientId,
    required String status,
    required DateTime createdAt,
  }) = _CoachClientRelationshipModel;

  factory CoachClientRelationshipModel.fromJson(Map<String, dynamic> json) =>
      _$CoachClientRelationshipModelFromJson(json);

  CoachClientRelationship toDomain() => CoachClientRelationship(
    id: id,
    coachId: coachId,
    clientId: clientId,
    status: status,
    createdAt: createdAt,
  );

  static CoachClientRelationshipModel fromDomain(
    CoachClientRelationship entity,
  ) => CoachClientRelationshipModel(
    id: entity.id,
    coachId: entity.coachId,
    clientId: entity.clientId,
    status: entity.status,
    createdAt: entity.createdAt,
  );
}
