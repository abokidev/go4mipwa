import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InAppWebViewExample(),
    );
  }
}

class InAppWebViewExample extends StatefulWidget {
  const InAppWebViewExample({super.key});

  @override
  _InAppWebViewExampleState createState() => _InAppWebViewExampleState();
}

class _InAppWebViewExampleState extends State<InAppWebViewExample> {
  InAppWebViewController? _webViewController; // Nullable controller for null safety
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: 100,
          height: 50,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Check if WebView can go back
          if (await _webViewController?.canGoBack() ?? false) {
            // If it can, navigate back within the WebView
            await _webViewController?.goBack();
            return false; // Prevent app from closing
          }
          return true; // Allow app to close if no more pages to go back to
        },
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri("https://mobile.go4mi.com/auth/login")),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  isLoading = true;
                });
              },
              onLoadStop: (controller, url) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading ? const Center(child: CircularProgressIndicator()) : Container(),
          ],
        ),
      ),
    );
  }
}
