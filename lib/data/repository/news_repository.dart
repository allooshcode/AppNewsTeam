import 'package:news_app_project/data/models/articles.dart';
import 'package:news_app_project/data/web_services/web_services.dart';

class NewsRepository {
  final DioHelper dioHelper;
  NewsRepository(this.dioHelper);

  Future<List<Articles>> getAllArticles(
      String url, Map<String, dynamic> query) async {
<<<<<<< Updated upstream
    NewsArticles newsArticles = await dioHelper
        .getData(url: url, query: query)
        .then((response) => NewsArticles(
            response.data['status'],
            (response.data['articles'] as List<dynamic>)
                .map((article) => Articles.fromJson(article))
                .toList()));
=======
    print('get all articles');
    List<Articles> articles = [];
    await dioHelper.getData(url: url, query: query).then((value) => {
    value.data['articles'].forEach((element) {
      Articles articalModel = Articles.fromJson(element);
      if(articalModel.urlToImage!="")
      articles.add(articalModel);
    })});
    // NewsArticles newsArticles = await dioHelper
    //     .getData(url: url, query: query)
    //     .then((response) => NewsArticles(
    //         response.data['status'],
    //         response.data['articles']
    //             .map((article) => Articles.fromJson(article))
    //             .toList() as List<Articles>));
    //
    
>>>>>>> Stashed changes

    return newsArticles.articles;
  }
}
