import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/repository/news_repository.dart';
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
    return BlocProvider<ArticlesCubit>(
      create: (_) => ArticlesCubit(NewsRepository(DioHelper())),
      child: BlocConsumer<ArticlesCubit, ArticlesState>(
        listener: (context, state) {},
        builder: (context, state) {
          ArticlesCubit _cubit = BlocProvider.of<ArticlesCubit>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: AppColors.main,
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: AppColors.scaffoldBackground,
                // backgroundColor: AppColors.scaffoldBackground,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: AppColors.scaffoldBackground,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.main,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                ),
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: AppColors.scaffoldBackground),
                    titleTextStyle: TextStyle(
                        color: AppColors.main,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    titleSpacing: 20.0,
                    backgroundColor: AppColors.scaffoldBackground,
                    // color: AppColors.scaffoldBackground,
                    elevation: 0,
                    iconTheme: IconThemeData(color: AppColors.main))),
            darkTheme: ThemeData(
                // primaryColor: Colors.white,
                primarySwatch: Colors.deepOrange,
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                // backgroundColor: HexColor('333739'),
                scaffoldBackgroundColor: HexColor('333739'),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor('333739'),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.main,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                ),
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.light,
                        statusBarColor: HexColor('333739')),
                    titleTextStyle: TextStyle(
                        color: AppColors.main,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    titleSpacing: 20.0,
                    backgroundColor: HexColor('333739'),
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.white))),
            themeMode: _cubit.isDark ? ThemeMode.dark : ThemeMode.light,

            home: SplashScreen(),
            onUnknownRoute: (_) =>
                MaterialPageRoute(builder: (_) => HomeScreen()),
            // onGenerateRoute: _appRouter.onGenerateRoute,
            // initialRoute: AppRouter.SPLASH_SCREEN,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
