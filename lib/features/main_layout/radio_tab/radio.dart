import 'package:flutter/material.dart';

import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/extensions/context_extension.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageAssets.radioTabBgImage)),
      ),
      child: Column(
        children: [
          Image.asset(ImageAssets.islamiLogo),
          SizedBox(height: context.getHeight * .3),
          Text(
            "Soon.....",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
