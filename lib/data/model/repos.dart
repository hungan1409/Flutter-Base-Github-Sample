import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/repos.freezed.dart';
part 'generated/repos.g.dart';

@freezed
sealed class Repos with _$Repos {
  const factory Repos({
    String? description,
    int? forksCount,
    String? fullName,
    String? language,
    int? id,
    int? stargazersCount,
    String? updatedAt,
    int? watchersCount,
    String? htmlUrl,
  }) = _Repos;

  factory Repos.fromJson(Map<String, dynamic> json) => _$ReposFromJson(json);
}
