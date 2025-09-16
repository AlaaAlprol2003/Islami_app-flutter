// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/core/prefs_manager.dart';
import 'package:my_first_app/core/routes_manager.dart';
import 'package:my_first_app/features/main_layout/quran_tab/most_recent_widget.dart';
import 'package:my_first_app/models/sura_model.dart';

class SuraListItem extends StatelessWidget {
  SuraListItem({super.key, required this.sura, required this.mostRecentKey});
  SuraModel sura;
  GlobalKey<MostRecentWidgetState> mostRecentKey;

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
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(ImageAssets.suraNumberBg),
              Text(
                sura.suraIndex,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white,
                ),
              ),
            ],
          ),
          SizedBox(width: 15),

          Column(
            children: [
              Text(
                sura.suraNameEnglish,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white,
                ),
              ),

              Text(
                "${sura.ayasNumber} Verses  ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            sura.suraNameArabic,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}

class SuraDetailsArguments {
  SuraModel sura;
  GlobalKey<MostRecentWidgetState> mostRecentKey;
  SuraDetailsArguments({required this.sura, required this.mostRecentKey});
}
