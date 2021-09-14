import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/business_logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:news_app/business_logic/cubit/theme_cubit/theme_states.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/ui/routing/app_router.dart';
import 'package:news_app/ui/screens/03-business/business_screen.dart';
import 'package:news_app/ui/screens/04-technology/technology_screen.dart';
import 'package:news_app/ui/screens/05-science/science_screen.dart';

class HomeScreen extends StatelessWidget {
  final textSearch = TextEditingController();

  final _keyNavigator = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesState>(
      listener: (context, state) {},
      builder: (context, state) {
        print('consumerr.............. build');
        ArticlesCubit _cubit = BlocProvider.of<ArticlesCubit>(context);
        return BlocConsumer<ThemeCubit, ThemeState>(
          listener: (context, state) {},
          builder: (context, state) {
            ThemeCubit _cubitTheme = BlocProvider.of<ThemeCubit>(context);

            return Scaffold(
                appBar: AppBar(
                  leading: Switch(
                      value: _cubitTheme.isDark,
                      onChanged: (value) {
                        _cubitTheme.changeThemeMode();
                      }),
                  title: FittedBox(child: Text('News App')),
                  actions: [
                    Container(
                        padding: EdgeInsetsDirectional.only(top: 4, start: 6),
                        margin: EdgeInsetsDirectional.all(6),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: _cubitTheme.isDark
                                ? Colors.white
                                : AppColors.scaffoldBackground,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                            controller: _cubit.textSearch,
                            maxLines: 1,
                            onChanged: (value) {
                              _cubit.searchArticlesNews(value);

                              // if (_cubit.textSearch.text.isEmpty) {
                              //   if (index == 0) {
                              //     _cubit.getBusinessArticles();
                              //   } else if (index == 1) {
                              //     _cubit.getTechnologyArticles();
                              //   }
                              //   _cubit.getScienceArticles();
                              // }
                            },
                            decoration: InputDecoration(
                                hintText: 'Search ', border: InputBorder.none
                                // filled: false
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(20),
                                //     borderSide: BorderSide(width: 12)),
                                )))
                  ],
                ),
                body: Navigator(
                  key: _keyNavigator,
                  onGenerateRoute: AppRouter().onGenerateRoute,
                  initialRoute: AppRouter.BUSINESS_SCREEN,
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: _cubit.navigationItems,
                  currentIndex: _cubit.index,
                  onTap: (index) {
                    _cubit.changeBottomNavigationIndex(index);

                    if (index == 0) {
                      _keyNavigator.currentState!
                          .pushNamed(AppRouter.BUSINESS_SCREEN);
                    } else if (index == 1) {
                      _keyNavigator.currentState!
                          .pushNamed(AppRouter.TECHNOLOGY_SCREEN);
                    } else {
                      _keyNavigator.currentState!
                          .pushNamed(AppRouter.SCIENCE_SCREEN);
                    }
                    print('index = $index');
                  },
                  selectedItemColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                  elevation: 2,
                  showUnselectedLabels: false,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                ));
          },
        );
      },
    );
  }
}
