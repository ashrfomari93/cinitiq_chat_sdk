import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CinitiqChatSdk {
  static Future<dynamic> openChat(
    BuildContext context, {
    required String token,
    required String baseUrl,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
    String? mainTitle,
  }) async {
    final uri = Uri.parse(baseUrl).replace(
      queryParameters: {
        "token": token,
        if (queryParams != null) ...queryParams,
      },
    );

    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _ChatWebView(
          url: uri.toString(),
          headers: {
            "Authorization": "Bearer $token",
            if (headers != null) ...headers,
          },
          mainTitle: mainTitle,
        ),
      ),
    );
  }
}

class _ChatWebView extends StatelessWidget {
  final String url;
  final Map<String, String> headers;
  final String? mainTitle;

  const _ChatWebView({
    super.key,
    required this.url,
    required this.headers,
    this.mainTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: (mainTitle?.isNotEmpty ?? false)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    mainTitle ?? 'Cinitiq AI',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const Text(
                    'By Cinitiq AI',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              )
            : const Text(
                'Cinitiq AI',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(url), headers: headers),
      ),
    );
  }
}
