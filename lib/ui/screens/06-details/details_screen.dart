import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/shared/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final Articles article;

  const DetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.article.url,
        ),
      ),
    );
  }
}
