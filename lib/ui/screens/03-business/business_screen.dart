import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/global_components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ArticlesCubit, ArticlesState>(
        listener: (context, state) {},
        builder: (context, state) {
          print('business build....');
          List<Articles> business =
              BlocProvider.of<ArticlesCubit>(context).business;
          final cubit = BlocProvider.of<ArticlesCubit>(context);
          if (state is ArticlesSearchLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state is ArticlesSearchFinished) {
            return buildArticlesList(
                articles: business, context: context, onRefresh: 'business');
          } else if (cubit.searchedArticles.length != 0) {
            return buildArticlesList(
                articles: cubit.searchedArticles,
                context: context,
                onRefresh: 'business');
          } else if (business.length != 0) {
            return buildArticlesList(
                articles: business, context: context, onRefresh: 'business');
          }
          // } else if (state is ArticlesLoadedState)
          //   return buildArticlesList(articles: state.articles);
          // else if (state is ArticlesSearchLoadedState)
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
