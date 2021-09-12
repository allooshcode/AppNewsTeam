import 'package:flutter/material.dart';
import 'package:news_app/shared/constants.dart';
import 'package:news_app/shared/global_components/app_bar.dart';
import 'package:news_app/ui/routing/app_router.dart';
import 'package:news_app/ui/screens/02-home/local_components/bottom_navigation.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreenIndex = 0;
  List<String> screens=[
    AppConstants.BUSINESS_SCREEN,
    AppConstants.TECHNOLOGY_SCREEN,
    AppConstants.SCIENCE_SCREEN,
  ];

  final _navigatorKey = GlobalKey<NavigatorState>();
  AppRouter _appRouter = AppRouter();

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      body: WillPopScope(
        onWillPop: _checkIfScreenCanBePopped,
        child: Navigator(
          key: _navigatorKey,
          initialRoute: screens[0],
          onGenerateRoute: _appRouter.onGenerateRoute,
        ),
      ),
      bottomNavigationBar: buildBottomNavigation(
        onItemClicked: (index) {
          setState(() {
            _navigatorKey.currentState!.pushNamed(screens[index]);
            currentScreenIndex = index;
          });
        },
        currentIndex: currentScreenIndex,
      ),
    );
  }
  Future<bool> _checkIfScreenCanBePopped()async{
    if(_navigatorKey.currentState!.canPop()) {
      _navigatorKey.currentState!.pop();
      return true;
    }
    return false;
  }

}
