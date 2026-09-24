// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_thread_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatThreadState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatThreadState()';
}


}

/// @nodoc
class $ChatThreadStateCopyWith<$Res>  {
$ChatThreadStateCopyWith(ChatThreadState _, $Res Function(ChatThreadState) __);
}


/// @nodoc


class ChatThreadInitial implements ChatThreadState {
  const ChatThreadInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatThreadState.initial()';
}


}




/// @nodoc


class ChatThreadLoading implements ChatThreadState {
  const ChatThreadLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatThreadState.loading()';
}


}




/// @nodoc


class ChatThreadLoaded implements ChatThreadState {
  const ChatThreadLoaded({required final  List<MessageEntity> messages}): _messages = messages;
  

 final  List<MessageEntity> _messages;
 List<MessageEntity> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatThreadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatThreadLoadedCopyWith<ChatThreadLoaded> get copyWith => _$ChatThreadLoadedCopyWithImpl<ChatThreadLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadLoaded&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatThreadState.loaded(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ChatThreadLoadedCopyWith<$Res> implements $ChatThreadStateCopyWith<$Res> {
  factory $ChatThreadLoadedCopyWith(ChatThreadLoaded value, $Res Function(ChatThreadLoaded) _then) = _$ChatThreadLoadedCopyWithImpl;
@useResult
$Res call({
 List<MessageEntity> messages
});




}
/// @nodoc
class _$ChatThreadLoadedCopyWithImpl<$Res>
    implements $ChatThreadLoadedCopyWith<$Res> {
  _$ChatThreadLoadedCopyWithImpl(this._self, this._then);

  final ChatThreadLoaded _self;
  final $Res Function(ChatThreadLoaded) _then;

/// Create a copy of ChatThreadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(ChatThreadLoaded(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,
  ));
}


}

/// @nodoc


class ChatThreadError implements ChatThreadState {
  const ChatThreadError({required this.failure});
  

 final  Failure failure;

/// Create a copy of ChatThreadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatThreadErrorCopyWith<ChatThreadError> get copyWith => _$ChatThreadErrorCopyWithImpl<ChatThreadError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ChatThreadState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ChatThreadErrorCopyWith<$Res> implements $ChatThreadStateCopyWith<$Res> {
  factory $ChatThreadErrorCopyWith(ChatThreadError value, $Res Function(ChatThreadError) _then) = _$ChatThreadErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ChatThreadErrorCopyWithImpl<$Res>
    implements $ChatThreadErrorCopyWith<$Res> {
  _$ChatThreadErrorCopyWithImpl(this._self, this._then);

  final ChatThreadError _self;
  final $Res Function(ChatThreadError) _then;

/// Create a copy of ChatThreadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ChatThreadError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
