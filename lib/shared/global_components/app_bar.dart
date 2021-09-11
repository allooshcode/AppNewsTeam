import 'package:flutter/material.dart';

import '../colors.dart';

AppBar defaultAppBar() {
  return AppBar(
    title: Text(
      'News app',
      style: TextStyle(color: AppColors.main),
    ),
    titleSpacing: 12,
    elevation: 0,
  );
}