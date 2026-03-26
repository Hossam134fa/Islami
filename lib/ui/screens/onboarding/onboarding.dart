import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';

import '../../utils/app_text_styles.dart';

class Onboarding extends StatelessWidget {
  static const String routeName = 'onboarding';
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> listPageViewModel = [
      buildPageView("Welcome", AppAssets.welcome, "Welcome To Islami App"),
      buildPageView(
        "Mosque",
        AppAssets.mosque,
        "Welcome To Islami",
        description: "We Are Very Excited To Have You In Our Community",
      ),
      buildPageView(
        "Quran",
        AppAssets.quranIntro,
        "Reading The Quran",
        description: "Read, and your Lord is the Most Generous",
      ),
      buildPageView(
        "Sebha",
        AppAssets.sebhaIntro,
        "Bearish",
        description: "Praise the name of your Lord, the Most High",
      ),
      buildPageView(
        "Radio",
        AppAssets.radioIntro,
        "Holy Quran Radio",
        description:
            "You can listen to the Holy Quran Radio through the application for free and easily",
      ),
    ];
    return IntroductionScreen(
      pages: listPageViewModel,
      back: const Text("Back", style: AppTextStyles.gold16Bold),
      next: const Text("Next", style: AppTextStyles.gold16Bold),
      done: const Text("Done", style: AppTextStyles.gold16Bold),
      onDone: () {
        Navigator.pushReplacementNamed(context, Home.routeName);
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(7.0),
        activeSize: const Size(18.0, 7.0),
        activeColor: AppColors.gold,
        color: AppColors.gray,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
        ),
      ),
      showBackButton: true,
      globalBackgroundColor: AppColors.black,
    );
  }

  PageViewModel buildPageView(
    String title,
    String centralizedImage,
    String body, {
    String description = "",
  }) => PageViewModel(
    titleWidget: Image.asset(AppAssets.islamiIntro),
    bodyWidget: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(centralizedImage),
        const SizedBox(height: 20),
        Text(
          body,
          style: AppTextStyles.gold24Bold,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: AppTextStyles.gold20Bold,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
