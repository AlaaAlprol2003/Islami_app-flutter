// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/extensions/context_extension.dart';

class HadithCardView extends StatefulWidget {
  HadithCardView({super.key, required this.hadithIndex});
  int hadithIndex;

  @override
  State<HadithCardView> createState() => _HadithCardViewState();
}

class _HadithCardViewState extends State<HadithCardView> {
  String filecontent = '';

  @override
  Widget build(BuildContext context) {
    loadHadithContent(widget.hadithIndex);
    return Container(
      width: context.getWidth * 0.8,
      height: context.getHeight * 0.68,

      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(10),

        image: DecorationImage(
          image: AssetImage("assets/images/HadithCardBackGround 1.png"),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(ImageAssets.hadithPatternImageLeft),
              Center(
                child:  Text(
                 filecontent,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
              ),
              Image.asset(ImageAssets.hadithPatternImageRight),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                textAlign: TextAlign.center,
                filecontent,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),
              ),
            ),
          ),
          Image.asset("assets/images/Mosque-02 2.png", fit: BoxFit.fill),
        ],
      ),
    );
  }

  void loadHadithContent(int hadithNum) async {
    String filePath = "assets/files/hadith/h${hadithNum + 1}.txt";
    String fileContent = await rootBundle.loadString(filePath);
     ///List<String> lines = fileContent.split("\n");
     
     
    filecontent = fileContent;
    setState(() {});
  }
}
