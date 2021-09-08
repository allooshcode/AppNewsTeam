import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_project/business_logic/cubit/articles_states.dart';
import 'package:news_app_project/constants.dart';
import 'package:news_app_project/data/models/articles.dart';
import 'package:news_app_project/data/repository/news_repository.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(ArticlesState initialState, this.newsRepository)
      : super(initialState);
  final NewsRepository newsRepository;

  List<Articles> business = [];
  getBusinessArticles() {
    emit(ArticlesLoadingState());
    if (business.length == 0) {
      newsRepository.getAllArticles(url, {
        'country': 'eg',
        'category': 'business',
        'apiKey': apiKey
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
}
