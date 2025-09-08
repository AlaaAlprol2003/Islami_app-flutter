// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';



class HadithCardView extends StatefulWidget {
  HadithCardView({super.key, required this.hadithIndex});
  int hadithIndex;

  @override
  State<HadithCardView> createState() => _HadithCardViewState();
}

class _HadithCardViewState extends State<HadithCardView> {
  /// HadithModel? hadith;
  String hadithContent = '';
  String hadithTitle = '';
  @override
  Widget build(BuildContext context) {
    loadHadithContent(widget.hadithIndex);
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: AssetImage("assets/images/HadithCardBackGround 1.png"),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImageAssets.hadithPatternImageLeft),

                    Image.asset(ImageAssets.hadithPatternImageRight),
                  ],
                ),
                if (hadithTitle.isNotEmpty)
                  Text(
                    hadithTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.black,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: hadithContent.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Text(
                      textAlign: TextAlign.center,
                      hadithContent,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.black,
                      ),
                    ),
            ),
          ),
          Image.asset("assets/images/Mosque-02 2.png"),
        ],
      ),
    );
  }

  void loadHadithContent(int hadithNum) async {
    String filePath = "assets/files/hadith/h${hadithNum + 1}.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> hadithLines = fileContent.trim().split("\n");
    String title = hadithLines[0];
    hadithTitle = title;
    hadithLines.removeAt(0);

    hadithContent = hadithLines.join();


    setState(() {});
  }
}
