import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/dio_helper.dart';
import 'package:news_app/shared/constants.dart';
import 'package:news_app/ui/screens/01-splash/splash_screen.dart';
import 'package:news_app/ui/screens/02-home/home_screen.dart';
import 'package:news_app/ui/screens/03-business/business_screen.dart';
import 'package:news_app/ui/screens/04-technology/technology_screen.dart';
import 'package:news_app/ui/screens/05-science/science_screen.dart';
import 'package:news_app/ui/screens/06-details/details_screen.dart';

class AppRouter {


  final ArticlesCubit _articlesCubit =
      ArticlesCubit(NewsRepository(DioHelper()));

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppConstants.SPLASH_SCREEN:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppConstants.HOME_SCREEN:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppConstants.BUSINESS_SCREEN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _articlesCubit..getBusinessArticles(),
            child: BusinessScreen(),
          ),
        );
      case AppConstants.TECHNOLOGY_SCREEN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _articlesCubit..getTechnologyArticles(),
            child: TechnologyScreen(),
          ),
        );
      case AppConstants.SCIENCE_SCREEN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _articlesCubit..getScienceArticles(),
            child: ScienceScreen(),
          ),
        );
      case AppConstants.DETAILS_SCREEN:
        print('details screen');
        print(routeSettings.arguments);
        final article = routeSettings.arguments as Articles;
        return MaterialPageRoute(builder: (_)=>DetailsScreen(article: article,));
      default:
        throw Exception('route ${routeSettings.name} not found');
    }
  }

  void dispose() {
    _articlesCubit.close();
  }
}
