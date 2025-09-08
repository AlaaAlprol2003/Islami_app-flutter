import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/extensions/context_extension.dart';
import 'package:my_first_app/features/main_layout/hadith_tab/hadith_card_view.dart';







class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/hadith_tab_bg_image.png"),
        fit: BoxFit.fill
        ),
        
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(ImageAssets.islamiLogo),

            SizedBox(height:context.getHeight * 0.04),
            CarouselSlider(
              options: CarouselOptions(
                height: 500,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,

              ),
                items: List.generate(50, (index)=>index).map((index){
                  return HadithCardView(hadithIndex: index);
                }).toList(), 
            )

          ],
        ),
      ),
      
     
      );
    
  }

}
