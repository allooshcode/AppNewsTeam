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

  Future onRefresh(
      {required String onRefresh,
      required BuildContext context,
      bool isNewPage = false}) async {
    if (onRefresh == 'business') {
      getBusinessArticles();
    } else if (onRefresh == 'tech') {
      getTechnologyArticles();
    } else {
      getScienceArticles();
    }
  }

  int page = 1;
  bool isSearchingNow = false;

  Future loadSearchArticlesNews({bool newPage = false}) async {
    if (textSearch.text.isEmpty) {
      searchedArticles = [];
      page = 1;
      isSearchingNow = false;
      emit(ArticlesSearchFinished());
    } else {
      if (!newPage) {
        // to add just the result of the final searched word
        searchedArticles = [];
      }
      isSearchingNow = true;
      final value =
          await newsRepository.searchNews(search: textSearch.text, page: page);
      searchedArticles.addAll(value);
      // }).catchError((err) {
      //   page = 1;
      //   isSearchingNow = false;
      // });
    }
  }

  void searchArticlesNews() {
    if (textSearch.text.isEmpty) {
      searchedArticles = [];
      page = 1;

      emit(ArticlesSearchFinished());
    } else {
      emit(ArticlesSearchLoading());

      // to add just the result of the final searched word
      searchedArticles = [];

      isSearchingNow = true;
      newsRepository
          .searchNews(search: textSearch.text, page: page)
          .then((value) {
        searchedArticles = value;
        emit(ArticlesSearchLoadedState(articles: searchedArticles));
      }).catchError((err) {
        isSearchingNow = false;

        page = 1;
        emit(ArticlesErrorState(err.toString()));
      });
    }
  }

  List<Articles> business = [];
  getBusinessArticles({bool isNewPage = false}) {
    // print(business.length);
    if (business.length == 0) {
      emit(ArticlesLoadingState());
      newsRepository.getAllArticles('business').then((value) {
        business = value;
        print(business.length);
        emit(ArticlesLoadedState(business));
      }).catchError((err) {
        print(err.toString());
        emit(ArticlesErrorState(err.toString()));
      });
    } else {
      emit(ArticlesLoadedState(business));
    }
  }

  List<Articles> technologies = [];
  List<Articles> getTechnologyArticles({bool isRefresh = true}) {
    if (isRefresh) {
      emit(ArticlesLoadingState());
      newsRepository.getAllArticles('technology').then((articles) {
        technologies = articles;

        emit(ArticlesLoadedState(technologies));
      });
    } else if (technologies.length == 0) {
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
