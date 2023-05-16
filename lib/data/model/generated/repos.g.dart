// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../repos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repos _$$_ReposFromJson(Map<String, dynamic> json) => _$_Repos(
      description: json['description'] as String?,
      forksCount: json['forks_count'] as int?,
      fullName: json['full_name'] as String?,
      language: json['language'] as String?,
      id: json['id'] as int?,
      stargazersCount: json['stargazers_count'] as int?,
      updatedAt: json['updated_at'] as String?,
      watchersCount: json['watchers_count'] as int?,
      htmlUrl: json['html_url'] as String?,
    );

Map<String, dynamic> _$$_ReposToJson(_$_Repos instance) => <String, dynamic>{
      'description': instance.description,
      'forks_count': instance.forksCount,
      'full_name': instance.fullName,
      'language': instance.language,
      'id': instance.id,
      'stargazers_count': instance.stargazersCount,
      'updated_at': instance.updatedAt,
      'watchers_count': instance.watchersCount,
      'html_url': instance.htmlUrl,
    };
