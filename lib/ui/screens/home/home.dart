import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_text_styles.dart';

import '../../utils/app_assets.dart';
import 'tabs/ahadeth/ahadeth.dart';
import 'tabs/radio/radio.dart';
import 'tabs/sebha/sebha.dart';
import 'tabs/time/time.dart';

class Home extends StatefulWidget {
  static const String routeName = 'home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 1;
  List<Widget> tabs = [
    QuranTap(),
    AhadethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget? buildBottomNavigationBar() => BottomNavigationBar(
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.black,
    iconSize: 30,
    selectedLabelStyle: AppTextStyles.white12Bold,
    onTap: (index) {
      selectedIndex = index;
      setState(() {});
    },
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
        icon: buildBottomNavigationBarIcon(
          AppAssets.icQuran,
          selectedIndex == 0,
        ),
        label: "Quran",
      ),
      BottomNavigationBarItem(
        icon: buildBottomNavigationBarIcon(
          AppAssets.icAhadeth,
          selectedIndex == 1,
        ),
        label: "Ahadeth",
      ),
      BottomNavigationBarItem(
        icon: buildBottomNavigationBarIcon(
          AppAssets.icSebha,
          selectedIndex == 2,
        ),
        label: "Sebha",
      ),
      BottomNavigationBarItem(
        icon: buildBottomNavigationBarIcon(
          AppAssets.icRadio,
          selectedIndex == 3,
        ),
        label: "Radio",
      ),
      BottomNavigationBarItem(
        icon: buildBottomNavigationBarIcon(
          AppAssets.icTime,
          selectedIndex == 4,
        ),
        label: "Time",
      ),
    ],
  );

  Widget buildBottomNavigationBarIcon(String iconPath, bool isSelected) =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? AppColors.blackWithOpacity60 : Colors.transparent,
        ),
        child: ImageIcon(AssetImage(iconPath)),
      );
}
