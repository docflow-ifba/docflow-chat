import 'package:docflow/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:docflow/models/message.dart';

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isAI = message.sender == MessageSender.assistant;
    final time = TimeOfDay.fromDateTime(message.timestamp).format(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isAI ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isAI) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Palette.docflow['blue']![500]!,
                    Palette.docflow['purple']![600]!,
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  'DF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isAI ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color:
                        isAI
                            ? Palette.docflow['dark']![400]
                            : Palette.docflow['purple']![600],
                    borderRadius: BorderRadius.only(
                      topLeft: isAI ? Radius.zero : const Radius.circular(12),
                      topRight: isAI ? const Radius.circular(12) : Radius.zero,
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    message.content,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
          ),
          if (!isAI) ...[
            const SizedBox(width: 12),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Palette.docflow['purple']![700],
              ),
              child: const Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
