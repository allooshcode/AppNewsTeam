import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/ui/routing/app_router.dart';
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

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRouter.HOME_SCREEN);
              },
              icon: Icon(Icons.close_fullscreen))
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          WebView(
            initialUrl: widget.article.url,
            onPageFinished: (_) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading) LinearProgressIndicator()
        ]),
      ),
    );
  }
}
