import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/global_components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesCubit>(
      create: (_) =>
          ArticlesCubit(NewsRepository(DioHelper()))..getBusinessArticles(),
      child: Scaffold(
        body: BlocBuilder<ArticlesCubit, ArticlesState>(
          builder: (context, state) {
            if (state is ArticlesLoadedState)
              return buildArticlesList(articles: state.articles);
            else if (state is ArticlesErrorState)
              return Center(
                child: Text(state.error),
              );
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
