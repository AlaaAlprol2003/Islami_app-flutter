import 'package:flutter/material.dart';
import 'package:my_first_app/core/assets_manager.dart';

import 'package:my_first_app/core/routes_manager.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    navigate();
  }
  void navigate(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            Spacer(flex: 6,),
            Image.asset(ImageAssets.splashLogo),
            Spacer(flex: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Image.asset(ImageAssets.brandingLogo),
            ),
          ],
        ),
      )
    );
  }
}


