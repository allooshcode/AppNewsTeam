
import 'package:flutter/material.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/shared/global_components/list_item.dart';


class ArticlesListView extends StatelessWidget {
  final  state;
  final List<Articles> articles;
  final Future<void>Function() onListRefreshed;
  ArticlesListView({required this.state, required this.articles,required this.onListRefreshed});
@override
  Widget build(BuildContext context) {
  if (state is ArticlesLoadedState)
    return _buildArticlesList(articles: articles,onRefreshIndicator: onListRefreshed);
  else if (state is ArticlesErrorState)
    return Center(
      child: Text(state.error),
    );
  return Center(child: CircularProgressIndicator());
  }


  Widget _buildArticlesList({required List<Articles> articles,required Future<void>Function() onRefreshIndicator}) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: RefreshIndicator(
        onRefresh: onRefreshIndicator,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListItem(article: articles[index]);
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
}


//
// Widget buildListDependingOnState(
//     {required state, required List<Articles> articles,required Future<void>Function() onListRefreshed}) {
//   if (state is ArticlesLoadedState)
//     return buildArticlesList(articles: articles,onRefreshIndicator: onListRefreshed);
//   else if (state is ArticlesErrorState)
//     return Center(
//       child: Text(state.error),
//     );
//   return Center(child: CircularProgressIndicator());
// }
