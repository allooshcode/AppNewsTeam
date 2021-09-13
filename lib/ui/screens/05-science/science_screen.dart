import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/global_components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          List<Articles> science =
              BlocProvider.of<ArticlesCubit>(context).science;
          final cubit = BlocProvider.of<ArticlesCubit>(context);

          if (state is ArticlesSearchFinished) {
            return buildArticlesList(
                articles: science, context: context, onRefresh: 'science');
          } else if (cubit.searchedArticles.length != 0) {
            return buildArticlesList(
                articles: cubit.searchedArticles,
                context: context,
                onRefresh: 'science');
          } else if (science.length != 0) {
            return buildArticlesList(
                articles: science, context: context, onRefresh: 'science');
          }
          // } else if (state is ArticlesLoadedState)
          //   return buildArticlesList(articles: state.articles);
          // else if (state is ArticlesErrorState)
          //   return Center(
          //     child: Text(state.error),
          //   );
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
