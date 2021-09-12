import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/shared/global_components/articles_list_view.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          return ArticlesListView(
            state: state,
            articles: BlocProvider.of<ArticlesCubit>(context).business,
            onListRefreshed: ()async{
              BlocProvider.of<ArticlesCubit>(context).makeBusinessArticlesEmpty();
              BlocProvider.of<ArticlesCubit>(context).getBusinessArticles();
            }
          );
        },
      ),
    );
  }
}
