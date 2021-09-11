import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/business_logic/cubit/articles_states.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/web_services.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/ui/routing/app_router.dart';
import 'package:news_app/ui/screens/03-business/business_screen.dart';
import 'package:news_app/ui/screens/04-technology/technology_screen.dart';
import 'package:news_app/ui/screens/05-science/science_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final _keyNavigator = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesState>(
      listener: (context, state) {},
      builder: (context, state) {
        ArticlesCubit _cubit = BlocProvider.of<ArticlesCubit>(context);

        return Scaffold(
            appBar: AppBar(
              title: Text(
                'News app',
                // style: TextStyle(color: AppColors.main),
              ),
              actions: [
                Switch(
                    value: _cubit.isDark,
                    onChanged: (value) {
                      _cubit.changeThemeMode();
                    })
              ],
              // backgroundColor: AppColors.scaffoldBackground,
              // titleSpacing: 12,
              // elevation: 0,
            ),
            body: Navigator(
              key: _keyNavigator,
              onGenerateRoute: AppRouter().onGenerateRoute,
              initialRoute: AppRouter.BUSINESS_SCREEN,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.phone_android),
                  label: 'Technology',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.science),
                  label: 'Science',
                ),
              ],
              currentIndex: index,
              onTap: (index) {
                setState(() {
                  this.index = index;
                });
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
              selectedItemColor:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              elevation: 2,
              showUnselectedLabels: false,
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            ));
      },
    );
  }
}
