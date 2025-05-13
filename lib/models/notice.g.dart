// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  publishedAt: DateTime.parse(json['publishedAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  status: json['status'] as String,
  organization: json['organization'] as String,
  category: json['category'] as String,
  views: (json['views'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'publishedAt': instance.publishedAt.toIso8601String(),
  'expiresAt': instance.expiresAt.toIso8601String(),
  'status': instance.status,
  'organization': instance.organization,
  'category': instance.category,
  'views': instance.views,
  'tags': instance.tags,
};
