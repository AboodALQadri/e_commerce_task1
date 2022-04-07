import 'package:e_commerce_task1/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_task1/view/welcome_screen.dart';
import 'package:get/get.dart';

import '../view/screens/auth/login_screen.dart';

class AppRoutes {
  //InitialRoutes

  static const welcome = Routes.welcomeScreen;

  static final routes = [
    GetPage(
      name: '/welcome_screen',
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: '/login_screen',
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: '/signUp_screen',
      page: () => const SignUpScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcome_screen';
  static const loginScreen = '/login_screen';
  static const signUpScreen = '/signUp_screen';
}
