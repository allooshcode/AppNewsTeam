import 'package:news_app_project/data/models/articles.dart';
import 'package:news_app_project/data/web_services/web_services.dart';

class NewsRepository {
  final DioHelper dioHelper;
  NewsRepository(this.dioHelper);

  Future<List<Articles>> getAllArticles(
      String url, Map<String, dynamic> query) async {
    NewsArticles newsArticles = await dioHelper
        .getData(url: url, query: query)
        .then((response) => NewsArticles(
            response.data['status'],
            (response.data['articles'] as List<dynamic>)
                .map((article) => Articles.fromJson(article))
                .toList()));

    return newsArticles.articles;
  }
}
