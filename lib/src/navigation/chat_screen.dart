import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String matchName;

  ChatScreen({required this.matchName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $matchName'),
      ),
      body: Center(
        child: Text('Chat with $matchName'),
      ),
    );
  }
}
