import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/constants.dart';

class NewsRepository {
  final DioHelper dioHelper;
  NewsRepository(this.dioHelper);

  Future<List<Articles>> searchNews(
      {required String search, int page = 1}) async {
    List<Articles> articles = [];

    await dioHelper.searchData(query: {
      'q': search,
      'language ': 'ar',
      'apiKey': AppConstants.API_KEY,
      'page': page
    }).then((response) {
      response.forEach((article) {
        final articleModel = Articles.fromJson(article);
        if (articleModel.urlToImage != '') articles.add(articleModel);
      });
    });

    return articles;
  }

  Future<List<Articles>> getAllArticles(String category) async {
    print('get all articles');
    List<Articles> articles = [];
    await dioHelper.getData(category: category).then((value) => {
          value.data['articles'].forEach((element) {
            Articles articleModel = Articles.fromJson(element);
            if (articleModel.urlToImage != "") articles.add(articleModel);
          })
        });

    print('finish get all articles');
    for (var article in articles) {
      print(article.title);
    }

    return articles;
  }
}
