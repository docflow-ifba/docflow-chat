import 'package:docflow/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  final VoidCallback toggleSidebar;

  const ChatHeader({super.key, required this.toggleSidebar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Palette.docflow['dark']![600],
        border: Border(
          bottom: BorderSide(color: Palette.docflow['dark']![300]!, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: toggleSidebar,
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset('assets/images/logo-img.png'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DOC:FLOW',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Assistente de Editais',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
