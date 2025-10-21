import 'package:flutter/material.dart';
import 'package:cinitiq_chat_sdk/cinitiq_chat_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Cinitiq Chat SDK Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              CinitiqChatSdk.openChat(
                context,
                token: "token",
                baseUrl: "https://Cinitiq.com/chat",
                mainTitle: "Cinitiq Assistance",
              );
            },
            child: const Text("Open Chat"),
          ),
        ),
      ),
    );
  }
}
