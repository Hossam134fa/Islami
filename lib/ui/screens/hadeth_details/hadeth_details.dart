import 'package:flutter/material.dart';
import 'package:islami/model/hadeth_model.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_text_styles.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "HadethDetails";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late HadethDM hadeth;

  @override
  Widget build(BuildContext context) {
    hadeth = ModalRoute.of(context)!.settings.arguments as HadethDM;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back, color: AppColors.gold)),
        centerTitle: true,
        title: Text("Hadith ${hadeth.numberOfHadeth}", style: AppTextStyles.gold20Bold),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(AppAssets.leftCorner),
                Expanded(
                  child: Text(
                    hadeth.title,
                    style: AppTextStyles.gold20Bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppAssets.rightCorner)
              ],
            ),
          ),
          Expanded(child: buildSura()),
          Image.asset(AppAssets.mosqueQuran)
        ],
      ),
    );
  }
  Widget buildSura() =>
      hadeth.content.isEmpty
          ? Center(child: CircularProgressIndicator(color: AppColors.gold))
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            hadeth.content,
            style: AppTextStyles.gold16Bold,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ),
      );


}
