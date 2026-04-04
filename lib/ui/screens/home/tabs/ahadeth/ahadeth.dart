import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadeth_model.dart';
import 'package:islami/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_text_styles.dart';

class AhadethTap extends StatefulWidget {
  const AhadethTap({super.key});

  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  List<HadethDM> ahadeth = [];
  int numOfAhadeth = 50;

  @override
  void initState() {
    readHadethContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.ahadethBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiIntro),
          if (ahadeth.isNotEmpty)
            Expanded(
              child: CarouselSlider.builder(
                itemCount: ahadeth.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        buildHadethContainer(itemIndex),
                options: CarouselOptions(
                  height: double.infinity,
                  enlargeFactor: .08,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildHadethContainer(int itemIndex) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetails.routeName, arguments: ahadeth[itemIndex]);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 40),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.hadethCard)),
        ),
        child: Column(
          children: [
            Text(
              ahadeth[itemIndex].title,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: AppTextStyles.black24Bold,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Text(
                ahadeth[itemIndex].content,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: AppTextStyles.black16Bold,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void readHadethContent() async {
    late String title;
    late String content;
    for (int i = 0; i < numOfAhadeth; i++) {
      String hadeth = await rootBundle.loadString(
        "assets/files/ahadeth/h${i + 1}.txt",
      );
      List<String> hadethLines = hadeth.split("\n");
      title = hadethLines.removeAt(0);
      content = hadethLines.join();
      ahadeth.add(
        HadethDM(numberOfHadeth: i + 1, title: title, content: content),
      );
    }
    setState(() {});
  }
}
