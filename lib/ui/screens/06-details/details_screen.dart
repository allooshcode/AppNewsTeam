import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles.dart';
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
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: defaultAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: widget.article.publishedAt,
              child: Image.network(
                widget.article.urlToImage,
              ),
            ),
            Expanded(
              child: Container(
                child: WebView(
                  initialUrl: widget.article.url,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
