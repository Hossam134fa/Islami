import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_constants.dart';
import 'package:islami/ui/utils/app_text_styles.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.homeBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          Image.asset(AppAssets.islamiIntro),
          buildSearchTextField(),
          Expanded(child: buildSuraListView()),
        ],
      ),
    );
  }

  Widget buildSearchTextField() {
    var defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      decoration: InputDecoration(
        focusedBorder: defaultBorder,
        enabledBorder: defaultBorder,
        hintText: "Sura Name",
        hintStyle: AppTextStyles.white16Bold,
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.icQuran),
          color: AppColors.gold,
          size: 28,
        ),
      ),
      style: AppTextStyles.white16Bold,
      cursorColor: AppColors.gold,
    );
  }

  Widget buildSuraListView() {
    return ListView.separated(
      itemCount: AppConstants.suras.length,
      itemBuilder: (context, index) {
        var sura = AppConstants.suras[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              SuraDetails.routeName,
              arguments: sura,
            );
          },
          child: SuraRow(sura: sura),
        );
      },
      separatorBuilder: (_, _) => Divider(indent: 64, endIndent: 64),
    );
  }
}
