import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/ui/screens/02-home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: AnimatedSplashScreen(
        duration: 4000,
        splash: Text(
          'Newsly',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            letterSpacing: 8,
            color: AppColors.main,
          ),
        ),
        nextScreen: HomeScreen(),
        //pageTransitionType: PageTransitionType.rotate,
        //scale is fine
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: AppColors.scaffoldBackground,
      ),
    );
  }
}
