import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    @JsonKey(name: 'html_url') final String? htmlUrl,
    @JsonKey(name: 'email') final String? email,
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'name') final String? name,
    @JsonKey(name: 'public_repos') final int? publicRepos
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
