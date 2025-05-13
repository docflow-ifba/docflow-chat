import 'package:docflow/core/theme/theme.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  final void Function(String) onSend;

  const MessageInput({super.key, required this.onSend});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    print('Sending message: $text');
    if (text.isEmpty) return;

    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Palette.docflow['dark']![600],
        border: Border(
          top: BorderSide(color: Palette.docflow['dark']![300]!, width: 1),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Palette.docflow['dark']![400],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Palette.docflow['dark']![300]!),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    minLines: 1,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Pergunte sobre o edital...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color:
                      _controller.text.trim().isEmpty
                          ? Colors.grey
                          : Colors.white,
                  onPressed:
                      _controller.text.trim().isEmpty ? null : _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
