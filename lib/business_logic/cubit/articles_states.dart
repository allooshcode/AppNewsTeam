import 'package:flutter/cupertino.dart';
import 'package:news_app/data/models/articles.dart';

@immutable
abstract class ArticlesState {}

class ArticlesInitialState extends ArticlesState {}

class ArticlesLoadingState extends ArticlesState {}

class ArticlesLoadedState extends ArticlesState {
  final List<Articles> articles;
  ArticlesLoadedState(this.articles);
}

class ArticlesErrorState extends ArticlesState {
  final String error;
  ArticlesErrorState(this.error);
}

class ArticlesSearchLoading extends ArticlesState {}

class ArticlesSearchFinished extends ArticlesState {}

class ArticlesSearchLoadedState extends ArticlesState {
  final List<Articles> articles;
  ArticlesSearchLoadedState({required this.articles});
}

class ArticleNavigationState extends ArticlesState {}
