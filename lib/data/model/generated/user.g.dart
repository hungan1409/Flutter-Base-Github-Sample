// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  avatarUrl: json['avatar_url'] as String?,
  htmlUrl: json['html_url'] as String?,
  email: json['email'] as String?,
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  publicRepos: (json['public_repos'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'avatar_url': instance.avatarUrl,
  'html_url': instance.htmlUrl,
  'email': instance.email,
  'id': instance.id,
  'name': instance.name,
  'public_repos': instance.publicRepos,
};
