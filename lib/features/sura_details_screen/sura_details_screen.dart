import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/features/sura_details_screen/verses_item.dart';
import 'package:my_first_app/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SuraModel suraArguments;
  String suraContent = '';
  List<String> suraVerses = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    suraArguments = ModalRoute.of(context)?.settings.arguments as SuraModel;
    loadSuraContent(suraArguments.suraIndex);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text(suraArguments.suraNameEnglish)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImageAssets.patternImageLeftCorner),
                Text(
                  suraArguments.suraNameArabic,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.gold,
                  ),
                ),
                Image.asset(ImageAssets.patternImageRightCorner),
              ],
            ),
          ),
          Expanded(
            child: suraVerses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: ColorsManager.gold),
                  )
                : ListView.builder(
                  itemBuilder: (context,index) => VersesItem(verse: suraVerses[index]),
                  itemCount: suraVerses.length,
                ),
          ),
          Image.asset(ImageAssets.suraDetailsImageBottom),
        ],
      ),
    );
  }

  void loadSuraContent(String suraIndex) async {
    String filePath = "assets/files/suras/$suraIndex.txt";
    String fileContent = await rootBundle.loadString(filePath);

    List<String> suraLines = fileContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "(${i + 1})";
    }
    ///suraContent = suraLines.join();
    suraVerses = suraLines;

  await Future.delayed(Duration(seconds: 1));

    setState(() {});
  }
}
