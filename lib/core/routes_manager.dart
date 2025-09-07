import 'package:flutter/material.dart';
import 'package:my_first_app/features/main_layout/main_layout.dart';
import 'package:my_first_app/features/sura_details_screen/sura_details_screen.dart';

import '../features/splash/splash_screen.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String mainLayout = '/main layout';
  static const String onBoarding = '/onboarding ';
  static const String suraDetailsScreen = '/sura details screen ';
  


  static Map<String,WidgetBuilder> routes ={
    splash:(context)=> SplashScreen(),
    mainLayout:(context)=> MainLayout(),
    suraDetailsScreen:(context)=> SuraDetailsScreen(),

  };
}