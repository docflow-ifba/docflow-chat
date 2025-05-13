import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart';

// flutter pub run build_runner build
@JsonSerializable()
class Notice {
  final String id;
  final String title;
  final String description;
  final DateTime publishedAt;
  final DateTime expiresAt;
  final String status;
  final String organization;
  final String category;
  final int views;
  final List<String> tags;

  Notice({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.expiresAt,
    required this.status,
    required this.organization,
    required this.category,
    required this.views,
    required this.tags,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}
