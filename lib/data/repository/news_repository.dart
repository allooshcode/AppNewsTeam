import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/dio_helper.dart';
import 'package:news_app/shared/constants.dart';

class NewsRepository {
  final DioHelper dioHelper;
  NewsRepository(this.dioHelper);

  Future<List<Articles>> getAllArticles(String category) async {
    print('get all articles');
    List<Articles> articles = [];
     dioHelper.getData(category: category).then(
          (response) => {
            response.data['articles'].forEach(
              (article) {
                Articles articleModel = Articles.fromJson(article);
                if (articleModel.urlToImage != "") articles.add(articleModel);
              },
            ),
          },
        );

    return articles;
  }
}
