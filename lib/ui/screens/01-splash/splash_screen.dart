import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/ui/screens/02-home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 4000,
        splash: _buildBody(),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: AppColors.scaffoldBackgroundDark,
      ),
    );
  }
  Widget _buildBody(){
    return Text(
      'Newsly',
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        letterSpacing: 8,
        color: AppColors.main,
      ),
    );
  }
}
