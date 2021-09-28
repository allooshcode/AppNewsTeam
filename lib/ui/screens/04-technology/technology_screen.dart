import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/global_components/global_components.dart';

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  _TechnologyScreenState createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        final _articles = BlocProvider.of<ArticlesCubit>(context).technologies;
        final _articlesSearched =
            BlocProvider.of<ArticlesCubit>(context).searchedArticles;

        if (state is ArticlesSearchLoadedState) {
          return ArticleListViewUsingNotification(
            onRefresh: 'tech',
            articles: _articlesSearched,
            state: state,
          );
        }
        return ArticleListViewUsingNotification(
          onRefresh: 'tech',
          articles: _articles,
          state: state,
        );
      },
    );
  }
}

// class TechnologyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<ArticlesCubit, ArticlesState>(
//         builder: (context, state) {
//           List<Articles> tech =
//               BlocProvider.of<ArticlesCubit>(context).technologies;
//           return ArticleListView(state, tech);
//         },
//       ),
//     );
//   }
// }
//
// class TechnologyScreen extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int page = 1;
//   List<String> items = [
//     'item 1',
//     'item 2',
//   ];
//   bool isLoading = false;
//
//   Future _loadData() async {
//     // perform fetching data delay
//     await new Future.delayed(new Duration(seconds: 2));
//
//     print("load more");
//     // update data and loading status
//     setState(() {
//       items.addAll(['item 1']);
//       print('items: ' + items.toString());
//       isLoading = false;
//     });
//   }
//
//   final _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: NotificationListener<ScrollNotification>(
//               onNotification: (ScrollNotification scrollInfo) {
//                 if (!isLoading &&
//                     scrollInfo.metrics.pixels ==
//                         scrollInfo.metrics.maxScrollExtent) {
//                   _loadData();
//
//                   // _controller.jumpTo(scrollInfo.metrics.extentInside);
//                   // start loading data
//                   setState(() {
//                     isLoading = true;
//                   });
//                 }
//                 return false;
//               },
//               child: ListView.builder(
//                 // controller: _controller,
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text('${items[index]}'),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Container(
//             height: isLoading ? 50.0 : 0,
//             color: Colors.transparent,
//             child: Center(
//               child: new CircularProgressIndicator(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
