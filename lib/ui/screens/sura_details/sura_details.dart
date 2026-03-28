import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_text_styles.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDM sura;
  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDM;
    if (suraContent.isEmpty) {
      readSuraContent();
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(onTap:(){Navigator.pop(context);},child: Icon(Icons.arrow_back, color: AppColors.gold)),
        centerTitle: true,
        title: Text(sura.nameEn, style: AppTextStyles.gold20Bold),
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
                    sura.nameAr,
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
    suraContent.isEmpty
        ? Center(child: CircularProgressIndicator(color: AppColors.gold))
        : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              suraContent,
              style: AppTextStyles.gold16Bold,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        );

  Future readSuraContent() async {
    String fileName = "assets/files/quran/${sura.index}.txt";
    Future<String> contentFuture = rootBundle.loadString(fileName);
    suraContent = await contentFuture;
    List<String> suraLines = suraContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] = "[${i + 1}] ${suraLines[i]}";
    }
    suraContent = suraLines.join();
    setState(() {});
  }
}
