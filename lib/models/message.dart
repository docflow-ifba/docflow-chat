import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String id;
  final String content;
  final MessageSender sender;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.content,
    required this.sender,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

enum MessageSender { user, assistant }
