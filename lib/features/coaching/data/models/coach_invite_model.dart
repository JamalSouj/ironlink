import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/features/coaching/domain/entities/coach_invite.dart';

part 'coach_invite_model.freezed.dart';
part 'coach_invite_model.g.dart';

@freezed
abstract class CoachInviteModel with _$CoachInviteModel {
  const CoachInviteModel._();

  const factory CoachInviteModel({
    required String id,
    required String coachId,
    required String inviteCode,
    required String status,
    DateTime? createdAt,
  }) = _CoachInviteModel;

  factory CoachInviteModel.fromJson(Map<String, dynamic> json) =>
      _$CoachInviteModelFromJson(json);

  CoachInvite toDomain() => CoachInvite(
    id: id,
    coachId: coachId,
    inviteCode: inviteCode,
    status: status,
    createdAt: createdAt,
  );

  static CoachInviteModel fromDomain(CoachInvite entity) => CoachInviteModel(
    id: entity.id,
    coachId: entity.coachId,
    inviteCode: entity.inviteCode,
    status: entity.status,
    createdAt: entity.createdAt,
  );
}
