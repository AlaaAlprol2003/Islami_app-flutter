import 'package:flutter/material.dart';
import 'package:my_first_app/config/theme_manager/theme_manager.dart';
import 'package:my_first_app/core/routes_manager.dart';


void main(){
  runApp (IslamiApp());
}
class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeManager.light,
       debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
     initialRoute: RoutesManager.splash,
      

    );
  }
}






