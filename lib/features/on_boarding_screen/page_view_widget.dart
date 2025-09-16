// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/extensions/context_extension.dart';

class PageViewWidget extends StatelessWidget {
  PageViewWidget({
    super.key,
    required this.title,
    this.desc,
    required this.imagePath,
  });
  String title;
  String? desc;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImageAssets.islamiLogo),
        SizedBox(height: 20),
        Image.asset(imagePath, height: context.getHeight * .35),
        SizedBox(height: 50),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: ColorsManager.gold,
          ),
        ),

        SizedBox(height: 20),
        Text(
          desc ?? "",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorsManager.gold,
          ),
        ),
      ],
    );
  }
}
