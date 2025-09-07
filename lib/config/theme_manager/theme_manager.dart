import 'package:flutter/material.dart';
import 'package:my_first_app/core/colors_manager.dart';

class ThemeManager{
  static final ThemeData light = ThemeData(
      scaffoldBackgroundColor: ColorsManager.black,

      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.gold,
        titleTextStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: ColorsManager.gold),
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.gold,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme:IconThemeData(color:ColorsManager.white ) ,
        unselectedIconTheme:IconThemeData(color: ColorsManager.black) ,
      )
  );
}