import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/models/articles.dart';
import 'package:news_app/shared/global_components/list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticleListViewUsingNotification extends StatefulWidget {
  final String onRefresh;
  final List<Articles> articles;
  final ArticlesState state;
  const ArticleListViewUsingNotification(
      {Key? key,
      required this.state,
      required this.articles,
      required this.onRefresh})
      : super(key: key);

  @override
  _ArticleListViewUsingNotificationState createState() =>
      _ArticleListViewUsingNotificationState();
}

class _ArticleListViewUsingNotificationState
    extends State<ArticleListViewUsingNotification> {
  bool _isLoading = false;
  bool isSearchingNow = false;
  final _controller = RefreshController();

  Future loadData(ArticlesCubit _cubit) async {
    await _cubit.loadSearchArticlesNews(newPage: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _cubit = BlocProvider.of<ArticlesCubit>(context);
    if (widget.state is ArticlesSearchLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Column(
      children: [
        Expanded(
            child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    if (_cubit.isSearchingNow) {
                      print(_cubit.isSearchingNow);
                      setState(() {
                        _isLoading = true;
                      });
                      loadData(_cubit).then((value) {
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    }
                  }
                  return false;
                },
                child: buildListView(_cubit, context))),
        if (_isLoading)
          Container(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }

  void onRefresh(ArticlesCubit cubit, BuildContext context) {
    try {
      cubit.onRefresh(onRefresh: 'tech', context: context).then((value) {
        _controller.refreshCompleted();
        if (mounted) {
          setState(() {});
        }
      });
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
  }

  Widget buildListView(ArticlesCubit cubit, BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      controller: _controller,
      onRefresh: () => onRefresh(cubit, context),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: widget.articles.length,
          itemBuilder: (ctx, index) => ListItem(
                article: widget.articles[index],
              )),
    );
  }
}

class ArticleListView extends StatefulWidget {
  final ArticlesState state;
  final List<Articles> _articles;
  ArticleListView(this.state, this._articles);

  @override
  _ArticleListViewState createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ArticlesCubit>(context);
    // TODO: implement build
    if (widget.state is ArticlesSearchLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (widget.state is ArticlesSearchFinished) {
      return buildArticlesList(
          articles: widget._articles, context: context, onRefresh: 'business');
    } else if (cubit.searchedArticles.length != 0) {
      return buildArticlesList(
          articles: cubit.searchedArticles,
          context: context,
          onRefresh: 'business');
    } else if (widget._articles.length != 0) {
      return buildArticlesList(
          articles: widget._articles, context: context, onRefresh: 'business');
    }

    return Center(child: CircularProgressIndicator());
  }

  Widget buildArticlesList(
      {required List<Articles> articles,
      required BuildContext context,
      required String onRefresh}) {
    final _cubit = BlocProvider.of<ArticlesCubit>(context);
    bool newPage = false;

    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: () {
          print('hi');
          _cubit.onRefresh(onRefresh: onRefresh, context: context);
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          _cubit.page += 1;
          newPage = true;

          await _cubit.loadSearchArticlesNews(newPage: true).then((value) {
            _refreshController.loadComplete();
            if (mounted) {
              setState(() {});
            }
          });

          // if (_cubit.searchedArticles.length == 0) {
          //   _refreshController.loadFailed();
          // } else {

          // }
        },
        child: ListView.builder(
          addAutomaticKeepAlives: true,
          itemBuilder: (context, index) {
            return ListItem(article: articles[index]);
          },
          itemCount: articles.length,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
