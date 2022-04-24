import 'package:e_commerce_task1/view/screens/categories_screen.dart';
import 'package:e_commerce_task1/view/screens/favourite_screen.dart';
import 'package:e_commerce_task1/view/screens/home_screen.dart';
import 'package:e_commerce_task1/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    'Uzay Shop',
    'Categories',
    'Favourites',
    'Settings',
  ].obs;
}
