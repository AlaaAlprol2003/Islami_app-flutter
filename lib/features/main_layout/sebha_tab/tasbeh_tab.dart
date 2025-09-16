import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/extensions/context_extension.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  double rotationAngle = 0.0;
  int index = 0;
  List<String> zeqrItem = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
  ];
  void incrementCounter() {
    counter++;
    rotationAngle += math.pi / 4;
    if (counter == 33) {
      index++;
      counter = 0;
      rotationAngle = 0.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageAssets.sebhaTabBgImage)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImageAssets.islamiLogo),
          SizedBox(height: context.getHeight * .01),
          Center(
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: ColorsManager.white,
              ),
            ),
          ),

          Expanded(
            child: Stack(
              alignment: Alignment.center,

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: incrementCounter,
                    child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: rotationAngle,
                      child: Image.asset(ImageAssets.sebhaImage),
                    ),
                  ),
                ),
                Text(
                  zeqrItem[index % zeqrItem.length],
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),

                Positioned(
                  bottom: context.getHeight * .16,
                  child: Text(
                    "$counter",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,

                      color: ColorsManager.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
