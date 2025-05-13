import 'package:docflow/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onClose;

  const Sidebar({super.key, required this.isOpen, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      left: isOpen ? 0 : -280,
      top: 0,
      bottom: 0,
      width: 280,
      child: Material(
        color: Palette.docflow['dark']![600],
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Palette.docflow['blue']![500]!,
                          Palette.docflow['purple']![400]!,
                          Palette.docflow['purple']![600]!,
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'DOC:FLOW',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: onClose,
                  ),
                ],
              ),
            ),
            // New chat button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Implement new chat
                  // Provider.of<ChatProvider>(
                  //   context,
                  //   listen: false,
                  // ).clearMessages();
                  onClose();
                },
                icon: Icon(Icons.add, color: Palette.docflow['purple']?[400]),
                label: const Text('New conversation'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Palette.docflow['dark']![300]!),
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            // Recent conversations
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'RECENT CONVERSATIONS',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildConversationItem('Academic notices Q&A', 'Now'),
                  _buildConversationItem('Research opportunities', '1h ago'),
                  _buildConversationItem('Scholarship deadlines', '2d ago'),
                ],
              ),
            ),
            // Bottom section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.delete_outline,
                      color: Colors.grey,
                    ),
                    title: const Text('Clear conversations'),
                    textColor: Colors.grey,
                    onTap: () {
                      // Provider.of<ChatProvider>(
                      //   context,
                      //   listen: false,
                      // ).clearMessages();
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Palette.docflow['dark']![400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DocFlow v0.1.0',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Helping you navigate academic notices since 2025',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConversationItem(String title, String time) {
    return ListTile(
      title: Text(title),
      subtitle: Text(time),
      titleTextStyle: const TextStyle(color: Colors.white),
      subtitleTextStyle: TextStyle(color: Colors.grey[400]),
      onTap: () {
        // TODO: Implement conversation selection
      },
    );
  }
}
