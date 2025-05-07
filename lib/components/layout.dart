// components/layout.dart
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: Column(children: [const Header(), Expanded(child: child)]),
        child: Column(children: [Expanded(child: child)]),
      ),
    );
  }
}
