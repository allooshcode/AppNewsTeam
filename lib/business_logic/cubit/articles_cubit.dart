import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/shared/constants.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this.newsRepository) : super(ArticlesInitialState());
  final NewsRepository newsRepository;

  int index = 0;
  changeBottomNavigationIndex(int index) {
    this.index = index;
    emit(ArticleNavigationState());
  }

  List<BottomNavigationBarItem> navigationItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.phone_android),
      label: 'Technology',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Articles> searchedArticles = [];
  TextEditingController textSearch = TextEditingController();

  void searchArticlesNews(String search) {
    if (search.isEmpty) {
      searchedArticles = [];
      emit(ArticlesSearchFinished());
    } else {
      emit(ArticlesSearchLoading());

      searchedArticles = [];

      newsRepository.searchNews(search).then((value) {
        searchedArticles = value;
        emit(ArticlesSearchLoadedState(articles: searchedArticles));
      }).catchError((err) {
        emit(ArticlesErrorState(err.toString()));
      });
    }
  }

  List<Articles> business = [];
  getBusinessArticles() {
    // print(business.length);
    if (business.length == 0) {
      emit(ArticlesLoadingState());
      newsRepository.getAllArticles('business').then((value) {
        business = value;
        emit(ArticlesLoadedState(business));
      }).catchError((err) {
        emit(ArticlesErrorState(err.toString()));
      });
    } else {
      emit(ArticlesLoadedState(business));
    }
  }

  List<Articles> technologies = [];
  List<Articles> getTechnologyArticles() {
    if (technologies.length == 0) {
      emit(ArticlesLoadingState());
      newsRepository.getAllArticles('technology').then((articles) {
        technologies = articles;
        emit(ArticlesLoadedState(technologies));
      }).catchError((err) {
        emit(ArticlesErrorState(err.toString()));
      });
    } else {
      emit(ArticlesLoadedState(technologies));
    }
    return technologies;
  }

  List<Articles> science = [];
  List<Articles> getScienceArticles() {
    if (science.length == 0) {
      emit(ArticlesLoadingState());
      newsRepository.getAllArticles('science').then((articles) {
        science = articles;
        emit(ArticlesLoadedState(science));
      }).catchError((err) {
        emit(ArticlesErrorState(err.toString()));
      });
    } else {
      emit(ArticlesLoadedState(science));
    }
    return science;
  }
}
