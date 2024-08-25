// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../repos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Repos _$ReposFromJson(Map<String, dynamic> json) {
  return _Repos.fromJson(json);
}

/// @nodoc
mixin _$Repos {
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int? get forksCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'language')
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int? get stargazersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchers_count')
  int? get watchersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String? get htmlUrl => throw _privateConstructorUsedError;

  /// Serializes this Repos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Repos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReposCopyWith<Repos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReposCopyWith<$Res> {
  factory $ReposCopyWith(Repos value, $Res Function(Repos) then) =
      _$ReposCopyWithImpl<$Res, Repos>;
  @useResult
  $Res call(
      {@JsonKey(name: 'description') String? description,
      @JsonKey(name: 'forks_count') int? forksCount,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'language') String? language,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'stargazers_count') int? stargazersCount,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'watchers_count') int? watchersCount,
      @JsonKey(name: 'html_url') String? htmlUrl});
}

/// @nodoc
class _$ReposCopyWithImpl<$Res, $Val extends Repos>
    implements $ReposCopyWith<$Res> {
  _$ReposCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Repos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? forksCount = freezed,
    Object? fullName = freezed,
    Object? language = freezed,
    Object? id = freezed,
    Object? stargazersCount = freezed,
    Object? updatedAt = freezed,
    Object? watchersCount = freezed,
    Object? htmlUrl = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      forksCount: freezed == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stargazersCount: freezed == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      watchersCount: freezed == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      htmlUrl: freezed == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReposImplCopyWith<$Res> implements $ReposCopyWith<$Res> {
  factory _$$ReposImplCopyWith(
          _$ReposImpl value, $Res Function(_$ReposImpl) then) =
      __$$ReposImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'description') String? description,
      @JsonKey(name: 'forks_count') int? forksCount,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'language') String? language,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'stargazers_count') int? stargazersCount,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'watchers_count') int? watchersCount,
      @JsonKey(name: 'html_url') String? htmlUrl});
}

/// @nodoc
class __$$ReposImplCopyWithImpl<$Res>
    extends _$ReposCopyWithImpl<$Res, _$ReposImpl>
    implements _$$ReposImplCopyWith<$Res> {
  __$$ReposImplCopyWithImpl(
      _$ReposImpl _value, $Res Function(_$ReposImpl) _then)
      : super(_value, _then);

  /// Create a copy of Repos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? forksCount = freezed,
    Object? fullName = freezed,
    Object? language = freezed,
    Object? id = freezed,
    Object? stargazersCount = freezed,
    Object? updatedAt = freezed,
    Object? watchersCount = freezed,
    Object? htmlUrl = freezed,
  }) {
    return _then(_$ReposImpl(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      forksCount: freezed == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stargazersCount: freezed == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      watchersCount: freezed == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      htmlUrl: freezed == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReposImpl implements _Repos {
  _$ReposImpl(
      {@JsonKey(name: 'description') this.description,
      @JsonKey(name: 'forks_count') this.forksCount,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'language') this.language,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'stargazers_count') this.stargazersCount,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'watchers_count') this.watchersCount,
      @JsonKey(name: 'html_url') this.htmlUrl});

  factory _$ReposImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReposImplFromJson(json);

  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'forks_count')
  final int? forksCount;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'language')
  final String? language;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'stargazers_count')
  final int? stargazersCount;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'watchers_count')
  final int? watchersCount;
  @override
  @JsonKey(name: 'html_url')
  final String? htmlUrl;

  @override
  String toString() {
    return 'Repos(description: $description, forksCount: $forksCount, fullName: $fullName, language: $language, id: $id, stargazersCount: $stargazersCount, updatedAt: $updatedAt, watchersCount: $watchersCount, htmlUrl: $htmlUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReposImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      forksCount,
      fullName,
      language,
      id,
      stargazersCount,
      updatedAt,
      watchersCount,
      htmlUrl);

  /// Create a copy of Repos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReposImplCopyWith<_$ReposImpl> get copyWith =>
      __$$ReposImplCopyWithImpl<_$ReposImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReposImplToJson(
      this,
    );
  }
}

abstract class _Repos implements Repos {
  factory _Repos(
      {@JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'forks_count') final int? forksCount,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'language') final String? language,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'stargazers_count') final int? stargazersCount,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'watchers_count') final int? watchersCount,
      @JsonKey(name: 'html_url') final String? htmlUrl}) = _$ReposImpl;

  factory _Repos.fromJson(Map<String, dynamic> json) = _$ReposImpl.fromJson;

  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'forks_count')
  int? get forksCount;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'language')
  String? get language;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'stargazers_count')
  int? get stargazersCount;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'watchers_count')
  int? get watchersCount;
  @override
  @JsonKey(name: 'html_url')
  String? get htmlUrl;

  /// Create a copy of Repos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReposImplCopyWith<_$ReposImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
