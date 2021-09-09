import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/shared/constants.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit( this.newsRepository)
      : super(ArticlesInitialState());
  final NewsRepository newsRepository;

  List<Articles> business = [];
  getBusinessArticles() {
    emit(ArticlesLoadingState());
    if (business.length == 0) {
      newsRepository.getAllArticles(AppConstants.URL, {
        'country': 'eg',
        'category': 'business',
        'apiKey': AppConstants.API_KEY
      }).then((value) {
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
      newsRepository.getAllArticles(AppConstants.URL, {
        'country': 'eg',
        'category': 'technology',
        'apiKey': AppConstants.API_KEY
      }).then((articles) {
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
      newsRepository.getAllArticles(AppConstants.URL, {
        'country': 'eg',
        'category': 'science',
        'apiKey': AppConstants.API_KEY
      }).then((articles) {
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
