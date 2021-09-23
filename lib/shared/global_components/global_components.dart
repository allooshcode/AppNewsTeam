import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/shared/global_components/list_item.dart';
import 'package:news_app/ui/screens/06-details/details_screen.dart';

class ArticleListView extends StatelessWidget {
  final ArticlesState state;
  final List<Articles> _articles;
  ArticleListView(this.state, this._articles);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ArticlesCubit>(context);
    // TODO: implement build
    if (state is ArticlesSearchLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (state is ArticlesSearchFinished) {
      return buildArticlesList(
          articles: _articles, context: context, onRefresh: 'business');
    } else if (cubit.searchedArticles.length != 0) {
      return buildArticlesList(
          articles: cubit.searchedArticles,
          context: context,
          onRefresh: 'business');
    } else if (_articles.length != 0) {
      return buildArticlesList(
          articles: _articles, context: context, onRefresh: 'business');
    }

    return Center(child: CircularProgressIndicator());
  }
}

Widget buildArticlesList(
    {required List<Articles> articles,
    required BuildContext context,
    required String onRefresh}) {
  return RefreshIndicator(
    onRefresh: () => _onRefresh(onRefresh: onRefresh, context: context),
    child: Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: ListView.builder(
        // controller: ,
        itemBuilder: (context, index) {
          return ListItem(article: articles[index]);
        },
        itemCount: articles.length,
        physics: BouncingScrollPhysics(),
      ),
    ),
  );
}

_onRefresh({required String onRefresh, required BuildContext context}) async {
  final _cubit = BlocProvider.of<ArticlesCubit>(context);
  if (onRefresh == 'business') {
    _cubit.getBusinessArticles();
  } else if (onRefresh == 'tech') {
    _cubit.getTechnologyArticles();
  } else {
    _cubit.getScienceArticles();
  }
}
