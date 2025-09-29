# Cinitiq Chat AI SDK

A Flutter SDK for integrating Cinitiq Chat AI with WebView support, authentication, and customizable headers.

## Features

- 🚀 Easy integration with just one method call
- 🔐 Built-in authentication with Bearer token support
- 🌐 WebView-based chat interface
- ⚙️ Customizable headers and query parameters
- 📱 Cross-platform support (iOS & Android)
- 💬 Loading indicators and error handling
- 🎨 Customizable AppBar

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  cinitiq_chat_ai: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Platform Setup

### Android

Add the following to your `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

Minimum SDK version should be 19 or higher in `android/app/build.gradle`:

```gradle
minSdkVersion 19
```

### iOS

Add the following to your `ios/Runner/Info.plist`:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

Or for specific domains:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSExceptionDomains</key>
    <dict>
        <key>your-domain.com</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
            <true/>
        </dict>
    </dict>
</dict>
```

## Usage

### Basic Usage

```dart
import 'package:cinitiq_chat_ai/cinitiq_chat_ai.dart';

// Open the chat interface
await CinitiqChatSdk.openChat(
  context,
  token: 'your-authentication-token',
  baseUrl: 'https://your-chat-url.com/chat',
);
```

### Advanced Usage

```dart
import 'package:cinitiq_chat_ai/cinitiq_chat_ai.dart';

// Open chat with custom headers and query parameters
final result = await CinitiqChatSdk.openChat(
  context,
  token: 'your-authentication-token',
  baseUrl: 'https://your-chat-url.com/chat',
  headers: {
    'X-Custom-Header': 'CustomValue',
    'X-Api-Key': 'your-api-key',
  },
  queryParams: {
    'userId': '12345',
    'lang': 'en',
    'theme': 'dark',
  },
);

// Handle the result when chat is closed
print('Chat closed with result: $result');
```

### Using ChatWebView Directly

If you need more control, you can use the `ChatWebView` widget directly:

```dart
import 'package:cinitiq_chat_ai/cinitiq_chat_ai.dart';

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ChatWebView(
      url: 'https://your-chat-url.com/chat?token=your-token',
      headers: {
        'Authorization': 'Bearer your-token',
      },
      title: 'Customer Support',
      showAppBar: true,
    ),
  ),
);
```

## API Reference

### CinitiqChatSdk.openChat()

Opens the chat interface in a new screen with WebView.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `context` | `BuildContext` | Yes | Build context for navigation |
| `token` | `String` | Yes | Authentication token |
| `baseUrl` | `String` | Yes | Base URL for the chat interface |
| `headers` | `Map<String, String>?` | No | Custom headers to include in the request |
| `queryParams` | `Map<String, String>?` | No | Query parameters to append to the URL |

**Returns:** `Future<dynamic>` - Returns the result when the chat screen is closed

### ChatWebView Widget

A customizable WebView widget for displaying the chat interface.

**Properties:**

| Property | Type | Required | Default | Description |
|----------|------|----------|---------|-------------|
| `url` | `String` | Yes | - | URL to load in the WebView |
| `headers` | `Map<String, String>` | Yes | - | Headers to include in the request |
| `title` | `String?` | No | `"Chat"` | Title for the AppBar |
| `showAppBar` | `bool` | No | `true` | Whether to show the AppBar |

## Example App

The package includes a complete example app. To run it:

```bash
cd example
flutter run
```

## Features in Detail

### Authentication

The SDK automatically includes the token as:
- Query parameter: `?token=your-token`
- Authorization header: `Authorization: Bearer your-token`

### Loading Indicator

A circular progress indicator is shown while the chat page is loading.

### Error Handling

WebView errors are logged to the debug console for troubleshooting.

### Navigation

The chat opens in a new screen with a back button in the AppBar, allowing users to easily return to the previous screen.

## Troubleshooting

### WebView not loading

1. Ensure you have internet permission (Android) and proper security settings (iOS)
2. Check if the URL is accessible from a mobile browser
3. Verify that your token is valid

### Headers not being sent

Headers are sent with the initial request. If you need headers for subsequent requests within the WebView, you may need to handle them on your server side.

### SSL Certificate errors

For development with self-signed certificates, you may need to adjust your platform-specific settings. For production, always use valid SSL certificates.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues, questions, or suggestions, please file an issue on our [GitHub repository](https://github.com/yourusername/cinitiq_chat_ai/issues).

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes in each version.

---

Made with ❤️ by Cinitiq