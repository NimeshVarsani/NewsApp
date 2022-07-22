import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DetailScreen extends StatefulWidget {

  String? readMoreUrl;
  DetailScreen(this.readMoreUrl);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: widget.readMoreUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress) {
          // print('WebView is loading (progress : $progress%)');
          const CircularProgressIndicator();
        },
        onPageStarted: (String url) {
          // print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          // print('Page finished loading: $url');
        },
      ),
    );
  }
}
