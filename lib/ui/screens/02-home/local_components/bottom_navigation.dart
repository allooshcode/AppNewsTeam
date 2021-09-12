import 'package:flutter/material.dart';
BottomNavigationBar buildBottomNavigation({required Function(int) onItemClicked,required int currentIndex}){
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business',),
      BottomNavigationBarItem(icon: Icon(Icons.phone_android),label: 'Technology',),
      BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science',),
    ],
    currentIndex: currentIndex,
    onTap: onItemClicked,
    showUnselectedLabels: false,

  );
}