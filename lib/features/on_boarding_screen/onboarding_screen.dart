import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_first_app/core/assets_manager.dart';
import 'package:my_first_app/core/colors_manager.dart';
import 'package:my_first_app/core/routes_manager.dart';
import 'package:my_first_app/features/on_boarding_screen/page_view_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "",
            bodyWidget: PageViewWidget(
              title: "Welcom To Islami App",
              imagePath: ImageAssets.onboardingImage1,
            ),
            decoration: PageDecoration(
              pageMargin: EdgeInsets.symmetric(horizontal: 20),

              safeArea: 0,
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: PageViewWidget(
              title: "Welcome To Islami",
              desc: "We Are Very Excited To Have You In Our Community",
              imagePath: ImageAssets.onboardingImage2,
            ),
            decoration: PageDecoration(
              pageMargin: EdgeInsets.symmetric(horizontal: 20),
              safeArea: 0,
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: PageViewWidget(
              title: "Reading the Quran",
              desc: "Read, and your Lord is the Most Generous",
              imagePath: ImageAssets.onboardingImage3,
            ),
            decoration: PageDecoration(
              safeArea: 0,
              pageMargin: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: PageViewWidget(
              title: "Bearish",
              desc: "Praise the name of your Lord, the Most High",
              imagePath: ImageAssets.onboardingImage4,
            ),
            decoration: PageDecoration(
              safeArea: 0,
              pageMargin: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: PageViewWidget(
              title: "Holy Quran Radio",
              desc:
                  "You can listen to the Holy Quran Radio through the application for free and easily",
              imagePath: ImageAssets.onboardingImage5,
            ),
            decoration: PageDecoration(
              safeArea: 0,
              pageMargin: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ],
        onDone: () {
          Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
        },
        showNextButton: true,
        next: Text(
          "Next",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorsManager.gold,
          ),
        ),
        showBackButton: true,
        back: Text(
          "Back",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorsManager.gold,
          ),
        ),
        done: Text(
          "Finish",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorsManager.gold,
          ),
        ),
        dotsDecorator: DotsDecorator(
          color: Colors.grey,
          activeColor: ColorsManager.gold,

          size: Size(10, 10),
        ),
      ),
    );
  }
}
