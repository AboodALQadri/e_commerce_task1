import 'package:e_commerce_task1/language/ar.dart';
import 'package:e_commerce_task1/language/en.dart';
import 'package:e_commerce_task1/language/fr.dart';
import 'package:e_commerce_task1/utils/my_string.dart';
import 'package:get/get.dart';


class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        eng: en,
        arb: ar,
        fra: fr,
      };
}
