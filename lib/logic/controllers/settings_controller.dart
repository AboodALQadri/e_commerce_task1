import 'package:e_commerce_task1/utils/my_string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var languageLocale = eng;

  String capitalize(String profileName) {
    return profileName.split(' ').map((name) => name.capitalize).join(' ');
  }

  @override
  void onInit() async {
    super.onInit();

    languageLocale = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (languageLocale == typeLang) {
      return;
    }
    if (typeLang == fra) {
      languageLocale = fra;
      saveLanguage(fra);
    } else if (typeLang == arb) {
      languageLocale = arb;
      saveLanguage(arb);
    } else {
      languageLocale = eng;
      saveLanguage(eng);
    }
    update();
  }
}
