import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/web_services.dart';

class NewsRepository {
  final DioHelper dioHelper;
  NewsRepository(this.dioHelper);

  // Future<L>

  Future<List<Articles>> getAllArticles(
      String url, Map<String, dynamic> query) async {
    print('get all articles');
    List<Articles> articles = [];
    await dioHelper.getData(url: url, query: query).then((value) => {
          value.data['articles'].forEach((element) {
            Articles articalModel = Articles.fromJson(element);
            if (articalModel.urlToImage != "") articles.add(articalModel);
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
