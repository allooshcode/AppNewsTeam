import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/ui/routing/app_router.dart';
import 'package:news_app/ui/screens/01-splash/splash_screen.dart';
import 'package:news_app/ui/screens/02-home/home_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'data/web_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.dioInit();
  runApp(NewsApp());
}

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      onGenerateRoute: _appRouter.onGenerateRoute,
      initialRoute: AppRouter.SPLASH_SCREEN,
    );
  }
  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}


