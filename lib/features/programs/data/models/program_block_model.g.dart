// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramBlockModel _$ProgramBlockModelFromJson(Map<String, dynamic> json) =>
    _ProgramBlockModel(
      id: json['id'] as String,
      programId: json['program_id'] as String,
      name: json['name'] as String,
      blockOrder: (json['block_order'] as num).toInt(),
      focus: json['focus'] as String?,
    );

Map<String, dynamic> _$ProgramBlockModelToJson(_ProgramBlockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program_id': instance.programId,
      'name': instance.name,
      'block_order': instance.blockOrder,
      'focus': instance.focus,
    };
