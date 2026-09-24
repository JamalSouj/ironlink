// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unread_badge_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UnreadBadgeEvent {

 String get currentUserId;
/// Create a copy of UnreadBadgeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnreadBadgeEventCopyWith<UnreadBadgeEvent> get copyWith => _$UnreadBadgeEventCopyWithImpl<UnreadBadgeEvent>(this as UnreadBadgeEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnreadBadgeEvent&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId));
}


@override
int get hashCode => Object.hash(runtimeType,currentUserId);

@override
String toString() {
  return 'UnreadBadgeEvent(currentUserId: $currentUserId)';
}


}

/// @nodoc
abstract mixin class $UnreadBadgeEventCopyWith<$Res>  {
  factory $UnreadBadgeEventCopyWith(UnreadBadgeEvent value, $Res Function(UnreadBadgeEvent) _then) = _$UnreadBadgeEventCopyWithImpl;
@useResult
$Res call({
 String currentUserId
});




}
/// @nodoc
class _$UnreadBadgeEventCopyWithImpl<$Res>
    implements $UnreadBadgeEventCopyWith<$Res> {
  _$UnreadBadgeEventCopyWithImpl(this._self, this._then);

  final UnreadBadgeEvent _self;
  final $Res Function(UnreadBadgeEvent) _then;

/// Create a copy of UnreadBadgeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentUserId = null,}) {
  return _then(_self.copyWith(
currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class UnreadBadgeStarted implements UnreadBadgeEvent {
  const UnreadBadgeStarted({required this.currentUserId});
  

@override final  String currentUserId;

/// Create a copy of UnreadBadgeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnreadBadgeStartedCopyWith<UnreadBadgeStarted> get copyWith => _$UnreadBadgeStartedCopyWithImpl<UnreadBadgeStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnreadBadgeStarted&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId));
}


@override
int get hashCode => Object.hash(runtimeType,currentUserId);

@override
String toString() {
  return 'UnreadBadgeEvent.started(currentUserId: $currentUserId)';
}


}

/// @nodoc
abstract mixin class $UnreadBadgeStartedCopyWith<$Res> implements $UnreadBadgeEventCopyWith<$Res> {
  factory $UnreadBadgeStartedCopyWith(UnreadBadgeStarted value, $Res Function(UnreadBadgeStarted) _then) = _$UnreadBadgeStartedCopyWithImpl;
@override @useResult
$Res call({
 String currentUserId
});




}
/// @nodoc
class _$UnreadBadgeStartedCopyWithImpl<$Res>
    implements $UnreadBadgeStartedCopyWith<$Res> {
  _$UnreadBadgeStartedCopyWithImpl(this._self, this._then);

  final UnreadBadgeStarted _self;
  final $Res Function(UnreadBadgeStarted) _then;

/// Create a copy of UnreadBadgeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentUserId = null,}) {
  return _then(UnreadBadgeStarted(
currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
