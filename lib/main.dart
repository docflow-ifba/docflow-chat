// main.dart
import 'package:docflow/components/layout.dart';
import 'package:docflow/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:docflow/pages/home_page.dart';
import 'package:docflow/pages/chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edital',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const Layout(child: HomePage()),
        '/chat': (context) {
          final noticeId = ModalRoute.of(context)!.settings.arguments as String;
          return Layout(child: ChatPage(noticeId: noticeId));
        },
      },
    );
  }
}
