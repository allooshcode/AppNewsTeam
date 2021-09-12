import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/shared/constants.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final NewsRepository newsRepository;
  List<Articles> business = [];
  List<Articles> technologies = [];
  List<Articles> science = [];

  ArticlesCubit(this.newsRepository) : super(ArticlesInitialState());

  void getBusinessArticles() {
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
  void makeBusinessArticlesEmpty(){
    business = [];
  }
  void makeTechnologyArticlesEmpty(){
    technologies = [];
  }
  void makeScienceArticlesEmpty(){
    science = [];
  }
}
