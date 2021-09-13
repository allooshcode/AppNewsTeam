import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/constants.dart';

class NewsRepository {
  final DioHelper dioHelper;
  NewsRepository(this.dioHelper);

  Future<List<Articles>> searchNews(String search) async {
    List<Articles> articles = [];

    await dioHelper.searchData(query: {
      'q': search,
      'language ': 'ar',
      'apiKey': AppConstants.API_KEY
    }).then((response) {
      response.forEach((article) {
        final articleModel = Articles.fromJson(article);
        if (articleModel.urlToImage != '') articles.add(articleModel);
      });
    });

    return articles;
  }

  Future<List<Articles>> getAllArticles(
      String url, Map<String, dynamic> query) async {
    print('get all articles');
    List<Articles> articles = [];
    await dioHelper.getData(url: url, query: query).then((value) => {
          value.data['articles'].forEach((element) {
            Articles articleModel = Articles.fromJson(element);
            if (articleModel.urlToImage != "") articles.add(articleModel);
          })
        });
    // NewsArticles newsArticles = await dioHelper
    //     .getData(url: url, query: query)
    //     .then((response) => NewsArticles(
    //         response.data['status'],
    //         response.data['articles']
    //             .map((article) => Articles.fromJson(article))
    //             .toList() as List<Articles>));
    //
    print('finish get all articles');
    for (var article in articles) {
      print(article.title);
    }

    return articles;
  }
}
