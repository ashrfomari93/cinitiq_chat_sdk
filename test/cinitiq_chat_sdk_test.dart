import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinitiq_chat_sdk/cinitiq_chat_sdk.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  testWidgets('CinitiqChatSdk can open chat', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          body: ElevatedButton(
            onPressed: () {
              CinitiqChatSdk.openChat(
                context,
                token: 'dummy_token',
                baseUrl: 'https://example.com/chat',
              );
            },
            child: const Text('Open Chat'),
          ),
        );
      }),
    ));

    expect(find.text('Open Chat'), findsOneWidget);

    await tester.tap(find.text('Open Chat'));
    await tester.pumpAndSettle();

    expect(find.byType(WebViewWidget), findsOneWidget);
  });
}
