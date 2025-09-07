// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_first_app/core/colors_manager.dart';

class VersesItem extends StatelessWidget {
  VersesItem({super.key, required this.verse});
  String verse;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
      

      color: ColorsManager.gold,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          verse,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorsManager.black,
          ),
        ),
      ),
    );
  }
}
