import 'package:docflow/models/message.dart';
import 'package:flutter/material.dart';
import 'package:docflow/widgets/message_item.dart';
import 'package:docflow/widgets/typing_indicator.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  const MessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      itemCount: messages.length + 1, // +1 for the typing indicator
      itemBuilder: (context, index) {
        if (index < messages.length) {
          return MessageItem(message: messages[index]);
        } else {
          // return const TypingIndicator();
        }
      },
    );
  }
}
