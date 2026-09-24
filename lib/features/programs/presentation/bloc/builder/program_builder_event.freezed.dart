// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_builder_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramBuilderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramBuilderEvent()';
}


}

/// @nodoc
class $ProgramBuilderEventCopyWith<$Res>  {
$ProgramBuilderEventCopyWith(ProgramBuilderEvent _, $Res Function(ProgramBuilderEvent) __);
}


/// @nodoc


class ProgramBuilderStarted implements ProgramBuilderEvent {
  const ProgramBuilderStarted({required this.programId});
  

 final  String programId;

/// Create a copy of ProgramBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramBuilderStartedCopyWith<ProgramBuilderStarted> get copyWith => _$ProgramBuilderStartedCopyWithImpl<ProgramBuilderStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderStarted&&(identical(other.programId, programId) || other.programId == programId));
}


@override
int get hashCode => Object.hash(runtimeType,programId);

@override
String toString() {
  return 'ProgramBuilderEvent.started(programId: $programId)';
}


}

/// @nodoc
abstract mixin class $ProgramBuilderStartedCopyWith<$Res> implements $ProgramBuilderEventCopyWith<$Res> {
  factory $ProgramBuilderStartedCopyWith(ProgramBuilderStarted value, $Res Function(ProgramBuilderStarted) _then) = _$ProgramBuilderStartedCopyWithImpl;
@useResult
$Res call({
 String programId
});




}
/// @nodoc
class _$ProgramBuilderStartedCopyWithImpl<$Res>
    implements $ProgramBuilderStartedCopyWith<$Res> {
  _$ProgramBuilderStartedCopyWithImpl(this._self, this._then);

  final ProgramBuilderStarted _self;
  final $Res Function(ProgramBuilderStarted) _then;

/// Create a copy of ProgramBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? programId = null,}) {
  return _then(ProgramBuilderStarted(
programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProgramBuilderAddBlock implements ProgramBuilderEvent {
  const ProgramBuilderAddBlock({required this.name, required this.blockOrder, this.focus});
  

 final  String name;
 final  int blockOrder;
 final  String? focus;

/// Create a copy of ProgramBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramBuilderAddBlockCopyWith<ProgramBuilderAddBlock> get copyWith => _$ProgramBuilderAddBlockCopyWithImpl<ProgramBuilderAddBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderAddBlock&&(identical(other.name, name) || other.name == name)&&(identical(other.blockOrder, blockOrder) || other.blockOrder == blockOrder)&&(identical(other.focus, focus) || other.focus == focus));
}


@override
int get hashCode => Object.hash(runtimeType,name,blockOrder,focus);

@override
String toString() {
  return 'ProgramBuilderEvent.addBlock(name: $name, blockOrder: $blockOrder, focus: $focus)';
}


}

/// @nodoc
abstract mixin class $ProgramBuilderAddBlockCopyWith<$Res> implements $ProgramBuilderEventCopyWith<$Res> {
  factory $ProgramBuilderAddBlockCopyWith(ProgramBuilderAddBlock value, $Res Function(ProgramBuilderAddBlock) _then) = _$ProgramBuilderAddBlockCopyWithImpl;
@useResult
$Res call({
 String name, int blockOrder, String? focus
});




}
/// @nodoc
class _$ProgramBuilderAddBlockCopyWithImpl<$Res>
    implements $ProgramBuilderAddBlockCopyWith<$Res> {
  _$ProgramBuilderAddBlockCopyWithImpl(this._self, this._then);

  final ProgramBuilderAddBlock _self;
  final $Res Function(ProgramBuilderAddBlock) _then;

/// Create a copy of ProgramBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? blockOrder = null,Object? focus = freezed,}) {
  return _then(ProgramBuilderAddBlock(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blockOrder: null == blockOrder ? _self.blockOrder : blockOrder // ignore: cast_nullable_to_non_nullable
as int,focus: freezed == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ProgramBuilderScheduleSession implements ProgramBuilderEvent {
  const ProgramBuilderScheduleSession({required this.blockId, required this.clientId, required this.date});
  

 final  String blockId;
 final  String clientId;
 final  DateTime date;

/// Create a copy of ProgramBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramBuilderScheduleSessionCopyWith<ProgramBuilderScheduleSession> get copyWith => _$ProgramBuilderScheduleSessionCopyWithImpl<ProgramBuilderScheduleSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderScheduleSession&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,blockId,clientId,date);

@override
String toString() {
  return 'ProgramBuilderEvent.scheduleSession(blockId: $blockId, clientId: $clientId, date: $date)';
}


}

/// @nodoc
abstract mixin class $ProgramBuilderScheduleSessionCopyWith<$Res> implements $ProgramBuilderEventCopyWith<$Res> {
  factory $ProgramBuilderScheduleSessionCopyWith(ProgramBuilderScheduleSession value, $Res Function(ProgramBuilderScheduleSession) _then) = _$ProgramBuilderScheduleSessionCopyWithImpl;
@useResult
$Res call({
 String blockId, String clientId, DateTime date
});




}
/// @nodoc
class _$ProgramBuilderScheduleSessionCopyWithImpl<$Res>
    implements $ProgramBuilderScheduleSessionCopyWith<$Res> {
  _$ProgramBuilderScheduleSessionCopyWithImpl(this._self, this._then);

  final ProgramBuilderScheduleSession _self;
  final $Res Function(ProgramBuilderScheduleSession) _then;

/// Create a copy of ProgramBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? blockId = null,Object? clientId = null,Object? date = null,}) {
  return _then(ProgramBuilderScheduleSession(
blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ProgramBuilderDuplicateWeek implements ProgramBuilderEvent {
  const ProgramBuilderDuplicateWeek({required this.blockId, required this.sourceStart, required this.targetStart});
  

 final  String blockId;
 final  DateTime sourceStart;
 final  DateTime targetStart;

/// Create a copy of ProgramBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramBuilderDuplicateWeekCopyWith<ProgramBuilderDuplicateWeek> get copyWith => _$ProgramBuilderDuplicateWeekCopyWithImpl<ProgramBuilderDuplicateWeek>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderDuplicateWeek&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.sourceStart, sourceStart) || other.sourceStart == sourceStart)&&(identical(other.targetStart, targetStart) || other.targetStart == targetStart));
}


@override
int get hashCode => Object.hash(runtimeType,blockId,sourceStart,targetStart);

@override
String toString() {
  return 'ProgramBuilderEvent.duplicateWeek(blockId: $blockId, sourceStart: $sourceStart, targetStart: $targetStart)';
}


}

/// @nodoc
abstract mixin class $ProgramBuilderDuplicateWeekCopyWith<$Res> implements $ProgramBuilderEventCopyWith<$Res> {
  factory $ProgramBuilderDuplicateWeekCopyWith(ProgramBuilderDuplicateWeek value, $Res Function(ProgramBuilderDuplicateWeek) _then) = _$ProgramBuilderDuplicateWeekCopyWithImpl;
@useResult
$Res call({
 String blockId, DateTime sourceStart, DateTime targetStart
});




}
/// @nodoc
class _$ProgramBuilderDuplicateWeekCopyWithImpl<$Res>
    implements $ProgramBuilderDuplicateWeekCopyWith<$Res> {
  _$ProgramBuilderDuplicateWeekCopyWithImpl(this._self, this._then);

  final ProgramBuilderDuplicateWeek _self;
  final $Res Function(ProgramBuilderDuplicateWeek) _then;

/// Create a copy of ProgramBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? blockId = null,Object? sourceStart = null,Object? targetStart = null,}) {
  return _then(ProgramBuilderDuplicateWeek(
blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,sourceStart: null == sourceStart ? _self.sourceStart : sourceStart // ignore: cast_nullable_to_non_nullable
as DateTime,targetStart: null == targetStart ? _self.targetStart : targetStart // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
