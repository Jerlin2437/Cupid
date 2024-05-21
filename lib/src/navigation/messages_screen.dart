import 'package:flutter/material.dart';
import 'chat_screen.dart'; 

class MessagesScreen extends StatelessWidget {
  final List<String> matches = [
    'Vibodh',
    'Ryan',
    'Jerlin',
    'Toma',
    'Quandale',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages Screen'),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(matches[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen( 
                    matchName: matches[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
