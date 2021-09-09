import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/ui/screens/06-details/details_screen.dart';

Widget listItem({required Articles article}) {
  return Builder(
    builder: (context) => InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsScreen(
              article: article,
            ),
          ),
        );
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
                Text(
                  article.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  article.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  article.publishedAt,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildArticlesList({required List<Articles> articles}) {
  return Padding(
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
  );
}
