// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../repos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReposImpl _$$ReposImplFromJson(Map<String, dynamic> json) => _$ReposImpl(
      description: json['description'] as String?,
      forksCount: (json['forks_count'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      language: json['language'] as String?,
      id: (json['id'] as num?)?.toInt(),
      stargazersCount: (json['stargazers_count'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
      watchersCount: (json['watchers_count'] as num?)?.toInt(),
      htmlUrl: json['html_url'] as String?,
    );

Map<String, dynamic> _$$ReposImplToJson(_$ReposImpl instance) =>
    <String, dynamic>{
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
