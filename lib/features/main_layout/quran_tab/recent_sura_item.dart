import 'package:flutter/material.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/core/prefs_manager.dart';
import 'package:my_first_app/core/routes_manager.dart';
import 'package:my_first_app/features/main_layout/quran_tab/most_recent_widget.dart';
import 'package:my_first_app/features/main_layout/quran_tab/sura_list_item.dart';
import 'package:my_first_app/models/sura_model.dart';

class RecentSuraItem extends StatelessWidget {
  const RecentSuraItem({
    super.key,
    required this.sura,
    required this.mostRecentKey,
  });
  final SuraModel sura;
  final GlobalKey<MostRecentWidgetState> mostRecentKey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PrefsManager.saveSuraIndex(sura.suraIndex);
        Navigator.pushNamed(
          context,
          RoutesManager.suraDetailsScreen,
          arguments: SuraDetailsArguments(
            sura: sura,
            mostRecentKey: mostRecentKey,
          ),
        );
      },
      child: Container(
        width: 300,
        height: 150,
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
                Text(
                  sura.suraNameEnglish,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
                Text(
                  sura.suraNameArabic,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
                Text(
                  "${sura.ayasNumber} verses",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
              ],
            ),
            Image.asset(ImageAssets.mostRecentCardImage),
          ],
        ),
      ),
    );
  }
}
