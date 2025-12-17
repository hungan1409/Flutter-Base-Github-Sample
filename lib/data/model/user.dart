import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user.freezed.dart';
part 'generated/user.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    String? avatarUrl,
    String? htmlUrl,
    String? email,
    int? id,
    String? name,
    int? publicRepos,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
