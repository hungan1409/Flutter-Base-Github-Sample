import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/repos.freezed.dart';
part 'generated/repos.g.dart';

@freezed
class Repos with _$Repos {
  factory Repos({
    @JsonKey(name: 'description') final String? description,
    @JsonKey(name: 'forks_count') final int? forksCount,
    @JsonKey(name: 'full_name') final String? fullName,
    @JsonKey(name: 'language') final String? language,
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'stargazers_count') final int? stargazersCount,
    @JsonKey(name: 'updated_at') final String? updatedAt,
    @JsonKey(name: 'watchers_count') final int? watchersCount,
    @JsonKey(name: 'html_url') final String? htmlUrl
  }) = _Repos;

  factory Repos.fromJson(Map<String, dynamic> json) =>
      _$ReposFromJson(json);
}
