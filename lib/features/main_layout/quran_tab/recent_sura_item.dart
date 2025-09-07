import 'package:flutter/material.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';

class RecentSuraItem extends StatelessWidget {
  const RecentSuraItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 283,
      height : 150,
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),


      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Text("Al-Fatiha",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
            color: ColorsManager.black
            ),),
            Text("الفاتحه",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
            color: ColorsManager.black
            ),),
            Text("7 verses",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
            color: ColorsManager.black
            ),),
          ],
         ),
         Image.asset(ImageAssets.recentCardImage)
        ],
      ),
  


    );
  }
}