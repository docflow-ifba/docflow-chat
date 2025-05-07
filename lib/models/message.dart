// models/message.dart
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
}

enum MessageSender { user, assistant }
