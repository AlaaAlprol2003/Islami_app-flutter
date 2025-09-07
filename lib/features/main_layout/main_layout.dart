import 'package:flutter/material.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/features/main_layout/hadith_tab/hadith_tab.dart';
import 'package:my_first_app/features/main_layout/quran_tab/quran_tab.dart';
import 'package:my_first_app/features/main_layout/radio_tab/radio_tab.dart';
import 'package:my_first_app/features/main_layout/sebha_tab/sebha_tab.dart';
import 'package:my_first_app/features/main_layout/time_tab/time_tab.dart';

class MainLayout extends StatefulWidget {
   MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
List<Widget> tabs = [
  QuranTab(),
  HadithTab(),
  SebhaTab(),
  RadioTab(),
  TimeTab(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: tabs[selectedIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar(){

    return  BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex){
         _onTap(newIndex);
        },

        items: [
          BottomNavigationBarItem(
            icon:_selectedNavBar(icon: IconAssets.quran, isSelected: selectedIndex == 0),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: _selectedNavBar(icon: IconAssets.hadith, isSelected: selectedIndex == 1),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: _selectedNavBar(icon: IconAssets.sebha, isSelected: selectedIndex == 2),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: _selectedNavBar(icon: IconAssets.radio, isSelected: selectedIndex == 3),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: _selectedNavBar(icon: IconAssets.time, isSelected: selectedIndex == 4),
            label: "Time",
          ),
        ]
    );
  }

  Widget _selectedNavBar({required String icon,required bool isSelected}){
    return isSelected ? Container(
        width: 50,
        height: 30,
        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
        decoration: BoxDecoration(
            color: ColorsManager.black.withOpacity(.6),
            borderRadius: BorderRadius.circular(12)
        ),
        child: ImageIcon(AssetImage(icon))): ImageIcon(AssetImage(icon));
  }

  void _onTap (int newIndex){
    selectedIndex = newIndex;
    setState(() {

    });
  }

}
