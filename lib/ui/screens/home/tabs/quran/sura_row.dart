import 'package:flutter/material.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_text_styles.dart';

class SuraRow extends StatelessWidget {
  final SuraDM sura;

  const SuraRow({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIndexImage(),
        SizedBox(width: 24),
        Expanded(child: buildEnInfo()),
        Text(sura.nameAr,style: AppTextStyles.white16Bold,),
      ],
    );
  }

  Widget buildIndexImage() => Stack(
    alignment: AlignmentGeometry.center,
    children: [
      Image.asset(AppAssets.suraNumberFrame),
      Text("${sura.index}", style: AppTextStyles.white16Bold),
    ],
  );

  Widget buildEnInfo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(sura.nameEn, style: AppTextStyles.white20Bold),
      SizedBox(height: 4),
      Text("${sura.numberOfAyahs} Verses", style: AppTextStyles.white14Bold),
    ],
  );
}
