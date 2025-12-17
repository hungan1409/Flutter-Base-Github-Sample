// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../repos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Repos {

 String? get description; int? get forksCount; String? get fullName; String? get language; int? get id; int? get stargazersCount; String? get updatedAt; int? get watchersCount; String? get htmlUrl;
/// Create a copy of Repos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReposCopyWith<Repos> get copyWith => _$ReposCopyWithImpl<Repos>(this as Repos, _$identity);

  /// Serializes this Repos to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Repos&&(identical(other.description, description) || other.description == description)&&(identical(other.forksCount, forksCount) || other.forksCount == forksCount)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.language, language) || other.language == language)&&(identical(other.id, id) || other.id == id)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.watchersCount, watchersCount) || other.watchersCount == watchersCount)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,forksCount,fullName,language,id,stargazersCount,updatedAt,watchersCount,htmlUrl);

@override
String toString() {
  return 'Repos(description: $description, forksCount: $forksCount, fullName: $fullName, language: $language, id: $id, stargazersCount: $stargazersCount, updatedAt: $updatedAt, watchersCount: $watchersCount, htmlUrl: $htmlUrl)';
}


}

/// @nodoc
abstract mixin class $ReposCopyWith<$Res>  {
  factory $ReposCopyWith(Repos value, $Res Function(Repos) _then) = _$ReposCopyWithImpl;
@useResult
$Res call({
 String? description, int? forksCount, String? fullName, String? language, int? id, int? stargazersCount, String? updatedAt, int? watchersCount, String? htmlUrl
});




}
/// @nodoc
class _$ReposCopyWithImpl<$Res>
    implements $ReposCopyWith<$Res> {
  _$ReposCopyWithImpl(this._self, this._then);

  final Repos _self;
  final $Res Function(Repos) _then;

/// Create a copy of Repos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = freezed,Object? forksCount = freezed,Object? fullName = freezed,Object? language = freezed,Object? id = freezed,Object? stargazersCount = freezed,Object? updatedAt = freezed,Object? watchersCount = freezed,Object? htmlUrl = freezed,}) {
  return _then(_self.copyWith(
description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,forksCount: freezed == forksCount ? _self.forksCount : forksCount // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,stargazersCount: freezed == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,watchersCount: freezed == watchersCount ? _self.watchersCount : watchersCount // ignore: cast_nullable_to_non_nullable
as int?,htmlUrl: freezed == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Repos].
extension ReposPatterns on Repos {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Repos value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Repos() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Repos value)  $default,){
final _that = this;
switch (_that) {
case _Repos():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Repos value)?  $default,){
final _that = this;
switch (_that) {
case _Repos() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? description,  int? forksCount,  String? fullName,  String? language,  int? id,  int? stargazersCount,  String? updatedAt,  int? watchersCount,  String? htmlUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Repos() when $default != null:
return $default(_that.description,_that.forksCount,_that.fullName,_that.language,_that.id,_that.stargazersCount,_that.updatedAt,_that.watchersCount,_that.htmlUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? description,  int? forksCount,  String? fullName,  String? language,  int? id,  int? stargazersCount,  String? updatedAt,  int? watchersCount,  String? htmlUrl)  $default,) {final _that = this;
switch (_that) {
case _Repos():
return $default(_that.description,_that.forksCount,_that.fullName,_that.language,_that.id,_that.stargazersCount,_that.updatedAt,_that.watchersCount,_that.htmlUrl);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? description,  int? forksCount,  String? fullName,  String? language,  int? id,  int? stargazersCount,  String? updatedAt,  int? watchersCount,  String? htmlUrl)?  $default,) {final _that = this;
switch (_that) {
case _Repos() when $default != null:
return $default(_that.description,_that.forksCount,_that.fullName,_that.language,_that.id,_that.stargazersCount,_that.updatedAt,_that.watchersCount,_that.htmlUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Repos implements Repos {
  const _Repos({this.description, this.forksCount, this.fullName, this.language, this.id, this.stargazersCount, this.updatedAt, this.watchersCount, this.htmlUrl});
  factory _Repos.fromJson(Map<String, dynamic> json) => _$ReposFromJson(json);

@override final  String? description;
@override final  int? forksCount;
@override final  String? fullName;
@override final  String? language;
@override final  int? id;
@override final  int? stargazersCount;
@override final  String? updatedAt;
@override final  int? watchersCount;
@override final  String? htmlUrl;

/// Create a copy of Repos
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReposCopyWith<_Repos> get copyWith => __$ReposCopyWithImpl<_Repos>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReposToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Repos&&(identical(other.description, description) || other.description == description)&&(identical(other.forksCount, forksCount) || other.forksCount == forksCount)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.language, language) || other.language == language)&&(identical(other.id, id) || other.id == id)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.watchersCount, watchersCount) || other.watchersCount == watchersCount)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,forksCount,fullName,language,id,stargazersCount,updatedAt,watchersCount,htmlUrl);

@override
String toString() {
  return 'Repos(description: $description, forksCount: $forksCount, fullName: $fullName, language: $language, id: $id, stargazersCount: $stargazersCount, updatedAt: $updatedAt, watchersCount: $watchersCount, htmlUrl: $htmlUrl)';
}


}

/// @nodoc
abstract mixin class _$ReposCopyWith<$Res> implements $ReposCopyWith<$Res> {
  factory _$ReposCopyWith(_Repos value, $Res Function(_Repos) _then) = __$ReposCopyWithImpl;
@override @useResult
$Res call({
 String? description, int? forksCount, String? fullName, String? language, int? id, int? stargazersCount, String? updatedAt, int? watchersCount, String? htmlUrl
});




}
/// @nodoc
class __$ReposCopyWithImpl<$Res>
    implements _$ReposCopyWith<$Res> {
  __$ReposCopyWithImpl(this._self, this._then);

  final _Repos _self;
  final $Res Function(_Repos) _then;

/// Create a copy of Repos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = freezed,Object? forksCount = freezed,Object? fullName = freezed,Object? language = freezed,Object? id = freezed,Object? stargazersCount = freezed,Object? updatedAt = freezed,Object? watchersCount = freezed,Object? htmlUrl = freezed,}) {
  return _then(_Repos(
description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,forksCount: freezed == forksCount ? _self.forksCount : forksCount // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,stargazersCount: freezed == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,watchersCount: freezed == watchersCount ? _self.watchersCount : watchersCount // ignore: cast_nullable_to_non_nullable
as int?,htmlUrl: freezed == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
