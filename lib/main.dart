import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:news_app/business_logic/cubit/theme_cubit/theme_states.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/shared/themes.dart';
import 'package:news_app/ui/routing/app_router.dart';
import 'package:news_app/ui/screens/01-splash/splash_screen.dart';
import 'package:news_app/ui/screens/02-home/home_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
            create: (_) => ArticlesCubit(NewsRepository(DioHelper()))
              ..getScienceArticles()
              ..getTechnologyArticles()
              ..getBusinessArticles()),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          ThemeCubit _cubitTheme = BlocProvider.of<ThemeCubit>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: _cubitTheme.isDark ? ThemeMode.dark : ThemeMode.light,

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
