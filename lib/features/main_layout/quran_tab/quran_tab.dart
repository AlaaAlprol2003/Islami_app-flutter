import 'package:flutter/material.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';

import 'package:my_first_app/features/main_layout/quran_tab/most_recent_widget.dart';

import 'package:my_first_app/features/main_layout/quran_tab/sura_list_item.dart';
import 'package:my_first_app/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filteredSuras = SuraModel.suras;
  var mostRecentKey = GlobalKey<MostRecentWidgetState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.quranTabBg),
            fit: BoxFit.fill,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(ImageAssets.islamiLogo),
                ),
                SizedBox(height: 21),
                TextField(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.white,
                  ),
                  onChanged: (input) {
                    filterSurasBySearchKey(input);
                  },

                  cursorColor: ColorsManager.offWhite,
                  decoration: InputDecoration(
                    prefixIcon: ImageIcon(AssetImage(IconAssets.quran)),
                    prefixIconColor: ColorsManager.gold,

                    label: Text("Sura Name"),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.offWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorsManager.gold,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorsManager.gold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                SizedBox(height: 10),
                MostRecentWidget(key: mostRecentKey),
                SizedBox(height: 10),
                Text(
                  "Sura List",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.offWhite,
                  ),
                ),
                SizedBox(height: 10),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      Divider(color: ColorsManager.white, thickness: 1),

                  itemCount: filteredSuras.length,
                  itemBuilder: (context, index) {
                    return SuraListItem(
                      sura: filteredSuras[index],
                      mostRecentKey: mostRecentKey,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void filterSurasBySearchKey(String searchKey) {
    filteredSuras = SuraModel.suras
        .where(
          (sura) =>
              sura.suraNameEnglish.toLowerCase().contains(
                searchKey.toLowerCase(),
              ) ||
              sura.suraNameArabic.contains(searchKey),
        )
        .toList();
    setState(() {});
  }
}
