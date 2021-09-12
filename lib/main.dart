import 'package:flutter/material.dart';
import 'package:news_app/shared/themes.dart';
import 'package:news_app/ui/screens/01-splash/splash_screen.dart';


import 'data/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.dioInit();
  runApp(NewsApp());
}
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: SplashScreen(),
    );
  }

}


