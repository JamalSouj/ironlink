// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_thread_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatThreadEvent {

 String get currentUserId; String get peerId;
/// Create a copy of ChatThreadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatThreadEventCopyWith<ChatThreadEvent> get copyWith => _$ChatThreadEventCopyWithImpl<ChatThreadEvent>(this as ChatThreadEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadEvent&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.peerId, peerId) || other.peerId == peerId));
}


@override
int get hashCode => Object.hash(runtimeType,currentUserId,peerId);

@override
String toString() {
  return 'ChatThreadEvent(currentUserId: $currentUserId, peerId: $peerId)';
}


}

/// @nodoc
abstract mixin class $ChatThreadEventCopyWith<$Res>  {
  factory $ChatThreadEventCopyWith(ChatThreadEvent value, $Res Function(ChatThreadEvent) _then) = _$ChatThreadEventCopyWithImpl;
@useResult
$Res call({
 String currentUserId, String peerId
});




}
/// @nodoc
class _$ChatThreadEventCopyWithImpl<$Res>
    implements $ChatThreadEventCopyWith<$Res> {
  _$ChatThreadEventCopyWithImpl(this._self, this._then);

  final ChatThreadEvent _self;
  final $Res Function(ChatThreadEvent) _then;

/// Create a copy of ChatThreadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentUserId = null,Object? peerId = null,}) {
  return _then(_self.copyWith(
currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class ChatThreadStarted implements ChatThreadEvent {
  const ChatThreadStarted({required this.currentUserId, required this.peerId});
  

@override final  String currentUserId;
@override final  String peerId;

/// Create a copy of ChatThreadEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatThreadStartedCopyWith<ChatThreadStarted> get copyWith => _$ChatThreadStartedCopyWithImpl<ChatThreadStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadStarted&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.peerId, peerId) || other.peerId == peerId));
}


@override
int get hashCode => Object.hash(runtimeType,currentUserId,peerId);

@override
String toString() {
  return 'ChatThreadEvent.started(currentUserId: $currentUserId, peerId: $peerId)';
}


}

/// @nodoc
abstract mixin class $ChatThreadStartedCopyWith<$Res> implements $ChatThreadEventCopyWith<$Res> {
  factory $ChatThreadStartedCopyWith(ChatThreadStarted value, $Res Function(ChatThreadStarted) _then) = _$ChatThreadStartedCopyWithImpl;
@override @useResult
$Res call({
 String currentUserId, String peerId
});




}
/// @nodoc
class _$ChatThreadStartedCopyWithImpl<$Res>
    implements $ChatThreadStartedCopyWith<$Res> {
  _$ChatThreadStartedCopyWithImpl(this._self, this._then);

  final ChatThreadStarted _self;
  final $Res Function(ChatThreadStarted) _then;

/// Create a copy of ChatThreadEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentUserId = null,Object? peerId = null,}) {
  return _then(ChatThreadStarted(
currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatThreadMessageSent implements ChatThreadEvent {
  const ChatThreadMessageSent({required this.currentUserId, required this.peerId, required this.body});
  

@override final  String currentUserId;
@override final  String peerId;
 final  String body;

/// Create a copy of ChatThreadEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatThreadMessageSentCopyWith<ChatThreadMessageSent> get copyWith => _$ChatThreadMessageSentCopyWithImpl<ChatThreadMessageSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadMessageSent&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.peerId, peerId) || other.peerId == peerId)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,currentUserId,peerId,body);

@override
String toString() {
  return 'ChatThreadEvent.messageSent(currentUserId: $currentUserId, peerId: $peerId, body: $body)';
}


}

/// @nodoc
abstract mixin class $ChatThreadMessageSentCopyWith<$Res> implements $ChatThreadEventCopyWith<$Res> {
  factory $ChatThreadMessageSentCopyWith(ChatThreadMessageSent value, $Res Function(ChatThreadMessageSent) _then) = _$ChatThreadMessageSentCopyWithImpl;
@override @useResult
$Res call({
 String currentUserId, String peerId, String body
});




}
/// @nodoc
class _$ChatThreadMessageSentCopyWithImpl<$Res>
    implements $ChatThreadMessageSentCopyWith<$Res> {
  _$ChatThreadMessageSentCopyWithImpl(this._self, this._then);

  final ChatThreadMessageSent _self;
  final $Res Function(ChatThreadMessageSent) _then;

/// Create a copy of ChatThreadEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentUserId = null,Object? peerId = null,Object? body = null,}) {
  return _then(ChatThreadMessageSent(
currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
