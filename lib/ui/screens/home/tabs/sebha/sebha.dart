import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_text_styles.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.sebhaBackground),
        fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiIntro),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: AppTextStyles.white36Bold,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          buildSebhaContainer(),
          SizedBox(height: 40,)
        ],
      ),
    );
  }

  Widget buildSebhaContainer() => Expanded(
    child: InkWell(
      onTap: (){
        counter++;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.sebha)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60,),
            Text(
              "سبحان الله",
              style: AppTextStyles.white36Bold,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            Text(
              "$counter",
              style: AppTextStyles.white36Bold,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}
