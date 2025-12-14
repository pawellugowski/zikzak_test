import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:zikzak_inappwebview/zikzak_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FirstWebViewScreen(),
    );
  }
}

class FirstWebViewScreen extends StatefulWidget {
  const FirstWebViewScreen({super.key});

  @override
  State<FirstWebViewScreen> createState() => _FirstWebViewScreenState();
}

class _FirstWebViewScreenState extends State<FirstWebViewScreen> {
  InAppWebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First WebView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SecondWebViewScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri('https://example.com'),
        ),
        onWebViewCreated: (controller) {
          _controller = controller;
        },
      ),
    );
  }

  @override
  void dispose() {
    // DO NOT manually dispose controller
    _controller = null;
    super.dispose();
  }
}


class SecondWebViewScreen extends StatefulWidget {
  const SecondWebViewScreen({super.key});

  @override
  State<SecondWebViewScreen> createState() => _SecondWebViewScreenState();
}

class _SecondWebViewScreenState extends State<SecondWebViewScreen> {
  InAppWebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second WebView'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri('https://flutter.dev'),
        ),
        onWebViewCreated: (controller) {
          _controller = controller;
        },
      ),
    );
  }

  @override
  void dispose() {
    // DO NOT manually dispose controller
    _controller = null;
    super.dispose();
  }
}
