import 'package:flutter/material.dart';
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

   late List screens ;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: unnecessary_statements
    screens=[
     BusinessScreen(),
      TechnologyScreen(),
      ScienceScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News app',style: TextStyle(color: AppColors.main),),
        backgroundColor: AppColors.scaffoldBackground,
        titleSpacing: 12,
        elevation: 0,

      ),
      body:screens[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business',),
          BottomNavigationBarItem(icon: Icon(Icons.phone_android),label: 'Technology',),
          BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science',),
        ],
        currentIndex: index,
        onTap: (index){
          setState(() {
            this.index = index;
          });
          print('index = $index');
        },
        selectedItemColor: AppColors.main,
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 2,
        showUnselectedLabels: false,

      ),

    );
  }
}
