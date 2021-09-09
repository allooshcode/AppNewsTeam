import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_project/business_logic/cubit/articles_cubit.dart';
import 'package:news_app_project/constants.dart';
import 'package:news_app_project/data/repository/news_repository.dart';
import 'package:news_app_project/data/web_services.dart';

class AppRouter {
  late final NewsRepository newsRepository;
  late final ArticlesCubit articlesCubit;

  AppRouter() {
    newsRepository = NewsRepository(DioHelper());
    articlesCubit = ArticlesCubit(newsRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(create: (_) => articlesCubit));
    }
  }
}
