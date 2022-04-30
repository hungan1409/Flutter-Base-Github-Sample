// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Repos _$ReposFromJson(Map<String, dynamic> json) {
  return _Repos.fromJson(json);
}

/// @nodoc
class _$ReposTearOff {
  const _$ReposTearOff();

  _Repos call(
      {@JsonKey(name: 'description') String? description,
      @JsonKey(name: 'forks_count') int? forksCount,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'language') String? language,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'stargazers_count') int? stargazersCount,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'watchers_count') int? watchersCount,
      @JsonKey(name: 'html_url') String? htmlUrl}) {
    return _Repos(
      description: description,
      forksCount: forksCount,
      fullName: fullName,
      language: language,
      id: id,
      stargazersCount: stargazersCount,
      updatedAt: updatedAt,
      watchersCount: watchersCount,
      htmlUrl: htmlUrl,
    );
  }

  Repos fromJson(Map<String, Object?> json) {
    return Repos.fromJson(json);
  }
}

/// @nodoc
const $Repos = _$ReposTearOff();

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReposCopyWith<Repos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReposCopyWith<$Res> {
  factory $ReposCopyWith(Repos value, $Res Function(Repos) then) =
      _$ReposCopyWithImpl<$Res>;
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
class _$ReposCopyWithImpl<$Res> implements $ReposCopyWith<$Res> {
  _$ReposCopyWithImpl(this._value, this._then);

  final Repos _value;
  // ignore: unused_field
  final $Res Function(Repos) _then;

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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      forksCount: forksCount == freezed
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stargazersCount: stargazersCount == freezed
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      watchersCount: watchersCount == freezed
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      htmlUrl: htmlUrl == freezed
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ReposCopyWith<$Res> implements $ReposCopyWith<$Res> {
  factory _$ReposCopyWith(_Repos value, $Res Function(_Repos) then) =
      __$ReposCopyWithImpl<$Res>;
  @override
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
class __$ReposCopyWithImpl<$Res> extends _$ReposCopyWithImpl<$Res>
    implements _$ReposCopyWith<$Res> {
  __$ReposCopyWithImpl(_Repos _value, $Res Function(_Repos) _then)
      : super(_value, (v) => _then(v as _Repos));

  @override
  _Repos get _value => super._value as _Repos;

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
    return _then(_Repos(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      forksCount: forksCount == freezed
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stargazersCount: stargazersCount == freezed
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      watchersCount: watchersCount == freezed
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      htmlUrl: htmlUrl == freezed
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Repos implements _Repos {
  _$_Repos(
      {@JsonKey(name: 'description') this.description,
      @JsonKey(name: 'forks_count') this.forksCount,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'language') this.language,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'stargazers_count') this.stargazersCount,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'watchers_count') this.watchersCount,
      @JsonKey(name: 'html_url') this.htmlUrl});

  factory _$_Repos.fromJson(Map<String, dynamic> json) =>
      _$$_ReposFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Repos &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.forksCount, forksCount) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.stargazersCount, stargazersCount) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.watchersCount, watchersCount) &&
            const DeepCollectionEquality().equals(other.htmlUrl, htmlUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(forksCount),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(language),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(stargazersCount),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(watchersCount),
      const DeepCollectionEquality().hash(htmlUrl));

  @JsonKey(ignore: true)
  @override
  _$ReposCopyWith<_Repos> get copyWith =>
      __$ReposCopyWithImpl<_Repos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReposToJson(this);
  }
}

abstract class _Repos implements Repos {
  factory _Repos(
      {@JsonKey(name: 'description') String? description,
      @JsonKey(name: 'forks_count') int? forksCount,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'language') String? language,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'stargazers_count') int? stargazersCount,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'watchers_count') int? watchersCount,
      @JsonKey(name: 'html_url') String? htmlUrl}) = _$_Repos;

  factory _Repos.fromJson(Map<String, dynamic> json) = _$_Repos.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$ReposCopyWith<_Repos> get copyWith => throw _privateConstructorUsedError;
}
