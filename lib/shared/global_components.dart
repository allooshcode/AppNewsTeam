import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/ui/screens/06-details/details_screen.dart';

Widget listItem({required Articles article}) {
  return Builder(
    builder: (context) => InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .pushReplacement(MaterialPageRoute(
          builder: (context) => new DetailsScreen(
            article: article,
          ),
        ));
      },
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Hero(
              tag: article.publishedAt,
              child: Image.network(
                article.urlToImage,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1),
                Text(article.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: 12,
                ),
                Text(
                  article.publishedAt,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildArticlesList(
    {required List<Articles> articles,
    required BuildContext context,
    required String onRefresh}) {
  return RefreshIndicator(
    onRefresh: () async {
      final _cubit = BlocProvider.of<ArticlesCubit>(context);
      if (onRefresh == 'business') {
        _cubit.getBusinessArticles();
      } else if (onRefresh == 'tech') {
        _cubit.getTechnologyArticles();
      } else {
        _cubit.getScienceArticles();
      }
    },
    child: Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return listItem(article: articles[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16,
          );
        },
        itemCount: articles.length,
        physics: BouncingScrollPhysics(),
      ),
    ),
  );
}
