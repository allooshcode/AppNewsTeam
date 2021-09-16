import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/ui/screens/06-details/details_screen.dart';

class ListItem extends StatelessWidget {
  final Articles article;
  ListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToDetails(context),
      child: Row(
        children: [
          _buildArticleImage(article),
          SizedBox(
            width: 12,
          ),
          _buildArticleInformation(context),
        ],
      ),
    );

    // TODO: implement build
  }

  Widget _buildArticleInformation(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTextHeader(context),
          _buildTextDescripetion(context),
          SizedBox(
            height: 12,
          ),
          _buildPublishedAt(context),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildText(
      {required String text, int maxLine = 1, required TextStyle style}) {
    return Text(
      text,
      maxLines: maxLine,
      style: style,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTextDescripetion(context) {
    return _buildText(
        text: article.description,
        maxLine: 2,
        style: Theme.of(context).textTheme.bodyText1!);
  }

  Widget _buildPublishedAt(BuildContext context) {
    return _buildText(
        text: article.publishedAt,
        style: Theme.of(context).textTheme.bodyText2!);
  }

  Widget _buildTextHeader(BuildContext context) {
    return _buildText(
        text: article.title, style: Theme.of(context).textTheme.bodyText1!);
  }

  Widget _buildArticleImage(Articles article) {
    return Image.network(
      article.urlToImage,
      height: 100,
      width: 150,
      fit: BoxFit.cover,
    );
  }

  void navigateToDetails(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(
      builder: (context) => new DetailsScreen(
        article: article,
      ),
    ));
  }
}
