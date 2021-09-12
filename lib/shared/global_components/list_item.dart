import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/ui/screens/06-details/details_screen.dart';

class ListItem extends StatelessWidget {
  final Articles article;

  ListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (_) => DetailsScreen(
            article: article,
          ),
        ));
      },
      child: Row(
        children: [
          _buildArticleImage(),
          SizedBox(
            width: 12,
          ),
          _buildArticleInformation(context),
        ],
      ),
    );
  }

  _onItemClicked(context) {
    //TODO implement named route
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (_) => DetailsScreen(
        article: article,
      ),
    ));
  }

  Widget _buildArticleImage() {
    return Expanded(
      flex: 3,
      child: Hero(
        tag: article.publishedAt,
        child: Image.network(
          article.urlToImage,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildArticleInformation(context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderText(context),
          _buildSubTitleText(context),
          const SizedBox(
            height: 12,
          ),
          _buildPublishedAtText(context),
        ],
      ),
    );
  }

  _buildText({required text,int maxLines = 1,required style}){
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
  Widget _buildHeaderText(context) {
    return _buildText(text: article.title, style: Theme.of(context).textTheme.subtitle1);
    // return Text(
    //   article.title,
    //   maxLines: 1,
    //   overflow: TextOverflow.ellipsis,
    //   style: Theme.of(context).textTheme.subtitle1,
    // );
  }

  Widget _buildSubTitleText(context) {
    return _buildText(text: article.description, style: Theme.of(context).textTheme.subtitle2,);

    // return Text(
    //   article.description,
    //   maxLines: 2,
    //   overflow: TextOverflow.ellipsis,
    //   style: Theme.of(context).textTheme.subtitle2,
    // );
  }

  Widget _buildPublishedAtText(context) {
    return _buildText(text: article.publishedAt, style: Theme.of(context).textTheme.caption,);

    // return Text(
    //   article.publishedAt,
    //   maxLines: 1,
    //   overflow: TextOverflow.ellipsis,
    //   style: Theme.of(context).textTheme.caption,
    // );
  }
}
