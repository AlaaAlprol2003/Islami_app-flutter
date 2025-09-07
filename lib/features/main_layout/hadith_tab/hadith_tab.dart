import 'package:flutter/material.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/extensions/context_extension.dart';

import 'package:my_first_app/hadith_card_view.dart';





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
           Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10),
               child: ListView.separated(
                separatorBuilder: (context,index)=>SizedBox(width: 16,),
                scrollDirection: Axis.horizontal,
                itemCount: 50,
                itemBuilder: (context,index){
                  return HadithCardView(hadithIndex: index);
                }),
             ),
           )
          ],
        ),
      ),
      
     
      );
    
  }

}
