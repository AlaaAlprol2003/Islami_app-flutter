import 'package:flutter/material.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/core/prefs_manager.dart';
import 'package:my_first_app/extensions/context_extension.dart';
import 'package:my_first_app/features/main_layout/quran_tab/recent_sura_item.dart';
import 'package:my_first_app/models/sura_model.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => MostRecentWidgetState();
}

class MostRecentWidgetState extends State<MostRecentWidget> {
  List<SuraModel> mostRecentSuras = [];
  void fetchMostRecent() async {
    mostRecentSuras = await PrefsManager.getMostRecentSuras();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentSuras.isEmpty ? false : true,
      child: Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          Text(
            "Most Recently",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsManager.offWhite,
            ),
          ),
          SizedBox(
            height: context.getHeight * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: mostRecentSuras.length,
              itemBuilder: (context, index) => RecentSuraItem(
                sura: mostRecentSuras[index],
                mostRecentKey: widget.key as GlobalKey<MostRecentWidgetState>,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
