// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  id: json['id'] as String,
  content: json['content'] as String,
  sender: $enumDecode(_$MessageSenderEnumMap, json['sender']),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'sender': _$MessageSenderEnumMap[instance.sender]!,
  'timestamp': instance.timestamp.toIso8601String(),
};

const _$MessageSenderEnumMap = {
  MessageSender.user: 'user',
  MessageSender.assistant: 'assistant',
};
