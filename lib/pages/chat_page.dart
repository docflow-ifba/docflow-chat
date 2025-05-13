// pages/chat_page.dart
import 'package:docflow/services/notice_service.dart';
import 'package:docflow/widgets/chat_header.dart';
import 'package:docflow/widgets/message_input.dart';
import 'package:docflow/widgets/message_list.dart';
import 'package:docflow/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:docflow/models/message.dart';

class ChatPage extends StatefulWidget {
  final String noticeId;

  const ChatPage({super.key, required this.noticeId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();
  final NoticeService noticeService = NoticeService();

  bool _isSidebarOpen = false;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  Future<void> _initializeChat() async {
    final notice = await noticeService.getById(widget.noticeId);
    final initialMessage = Message(
      id: '1',
      content:
          "Olá! Vejo que você está interessado em ${notice.title}. Como posso ajudá-lo com este edital?",

      sender: MessageSender.assistant,
      timestamp: DateTime.now(),
    );
    setState(() {
      _messages.add(initialMessage);
    });
    _scrollToBottom();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1E22),
      body: Stack(
        children: [
          Column(
            children: [
              ChatHeader(toggleSidebar: _toggleSidebar),
              Expanded(child: MessageList(messages: _messages)),
              MessageInput(
                onSend: (text) {
                  final userMessage = Message(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    content: text,
                    sender: MessageSender.user,
                    timestamp: DateTime.now(),
                  );

                  setState(() {
                    _messages.add(userMessage);
                  });

                  _scrollToBottom();
                },
              ),
            ],
          ),
          Sidebar(
            isOpen: _isSidebarOpen,
            onClose: () => setState(() => _isSidebarOpen = false),
          ),
        ],
      ),
    );
  }
}
