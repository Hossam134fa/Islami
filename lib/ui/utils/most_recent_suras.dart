import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract final class MostRecentSuras {
  static List<SuraDM> surasList = [];
  static const suraKey = "suras";

  static Future loadSurasList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> currentSuras = prefs.getStringList(suraKey) ?? []; 
    surasList = currentSuras.map((string) => AppConstants.suras[int.parse(string) - 1]).toList().reversed.toList();
  }
  static Future addSurasList(SuraDM sura) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> oldSuras = prefs.getStringList(suraKey) ?? [];
    if(oldSuras.contains(sura.index.toString())){
      oldSuras.remove(sura.index.toString());
      oldSuras.add(sura.index.toString());
    }else{
      oldSuras.add(sura.index.toString());
    }
    prefs.setStringList(suraKey, oldSuras);
    await loadSurasList();
  }
}