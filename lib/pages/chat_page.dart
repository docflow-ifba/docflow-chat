// pages/chat_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:docflow/components/chat_message.dart';
import 'package:docflow/models/message.dart';
import 'package:docflow/providers/notice_provider.dart';

class ChatPage extends StatefulWidget {
  final String noticeId;

  const ChatPage({super.key, required this.noticeId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> _messages = [];
  final TextEditingController _inputController = TextEditingController();
  bool _isIdentified = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeChat();
  }

  void _initializeChat() {
    final notice = NoticeProvider.of(context).getNoticeById(widget.noticeId);
    if (notice != null) {
      final initialMessage = Message(
        id: '1',
        content:
            "Hi there! I see you're interested in ${notice.title}. How can I help you with this public notice?",
        sender: MessageSender.assistant,
        timestamp: DateTime.now(),
      );
      setState(() {
        _messages.add(initialMessage);
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSubmit() {
    if (_inputController.text.trim().isEmpty) return;

    final userMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: _inputController.text,
      sender: MessageSender.user,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(userMessage);
      _inputController.clear();
    });

    _scrollToBottom();

    Future.delayed(const Duration(seconds: 1), () {
      final notice = NoticeProvider.of(context).getNoticeById(widget.noticeId);
      if (notice == null) return;

      Message assistantMessage;
      if (!_isIdentified) {
        setState(() {
          _isIdentified = true;
        });
        assistantMessage = Message(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content:
              "I've identified that you're asking about ${notice.title}. What specific aspect of this public notice would you like to discuss?",
          sender: MessageSender.assistant,
          timestamp: DateTime.now(),
        );
      } else {
        assistantMessage = Message(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content:
              "Thanks for your question about ${notice.title}. This is where I would provide a detailed response based on the content of the public notice and your question.",
          sender: MessageSender.assistant,
          timestamp: DateTime.now(),
        );
      }

      setState(() {
        _messages.add(assistantMessage);
      });
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notice = NoticeProvider.of(context).getNoticeById(widget.noticeId);

    if (notice == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Edital não encontrado!'),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Retorne ao início'),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Feather.arrow_left,
                  size: 20,
                  color: Color(0xFF1E3A8A),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notice.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      notice.organization,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
