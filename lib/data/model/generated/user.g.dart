// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      avatarUrl: json['avatar_url'] as String?,
      htmlUrl: json['html_url'] as String?,
      email: json['email'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      publicRepos: json['public_repos'] as int?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'public_repos': instance.publicRepos,
    };
