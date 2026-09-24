// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserModel {

 String get id; String get email; String get fullName; String get role; String? get inviteCode; String? get avatarUrl; DateTime? get createdAt;
/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<AuthUserModel> get copyWith => _$AuthUserModelCopyWithImpl<AuthUserModel>(this as AuthUserModel, _$identity);

  /// Serializes this AuthUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,role,inviteCode,avatarUrl,createdAt);

@override
String toString() {
  return 'AuthUserModel(id: $id, email: $email, fullName: $fullName, role: $role, inviteCode: $inviteCode, avatarUrl: $avatarUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AuthUserModelCopyWith<$Res>  {
  factory $AuthUserModelCopyWith(AuthUserModel value, $Res Function(AuthUserModel) _then) = _$AuthUserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, String fullName, String role, String? inviteCode, String? avatarUrl, DateTime? createdAt
});




}
/// @nodoc
class _$AuthUserModelCopyWithImpl<$Res>
    implements $AuthUserModelCopyWith<$Res> {
  _$AuthUserModelCopyWithImpl(this._self, this._then);

  final AuthUserModel _self;
  final $Res Function(AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? role = null,Object? inviteCode = freezed,Object? avatarUrl = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AuthUserModel extends AuthUserModel {
  const _AuthUserModel({required this.id, required this.email, required this.fullName, required this.role, this.inviteCode, this.avatarUrl, this.createdAt}): super._();
  factory _AuthUserModel.fromJson(Map<String, dynamic> json) => _$AuthUserModelFromJson(json);

@override final  String id;
@override final  String email;
@override final  String fullName;
@override final  String role;
@override final  String? inviteCode;
@override final  String? avatarUrl;
@override final  DateTime? createdAt;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserModelCopyWith<_AuthUserModel> get copyWith => __$AuthUserModelCopyWithImpl<_AuthUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,role,inviteCode,avatarUrl,createdAt);

@override
String toString() {
  return 'AuthUserModel(id: $id, email: $email, fullName: $fullName, role: $role, inviteCode: $inviteCode, avatarUrl: $avatarUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AuthUserModelCopyWith<$Res> implements $AuthUserModelCopyWith<$Res> {
  factory _$AuthUserModelCopyWith(_AuthUserModel value, $Res Function(_AuthUserModel) _then) = __$AuthUserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String fullName, String role, String? inviteCode, String? avatarUrl, DateTime? createdAt
});




}
/// @nodoc
class __$AuthUserModelCopyWithImpl<$Res>
    implements _$AuthUserModelCopyWith<$Res> {
  __$AuthUserModelCopyWithImpl(this._self, this._then);

  final _AuthUserModel _self;
  final $Res Function(_AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? role = null,Object? inviteCode = freezed,Object? avatarUrl = freezed,Object? createdAt = freezed,}) {
  return _then(_AuthUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
