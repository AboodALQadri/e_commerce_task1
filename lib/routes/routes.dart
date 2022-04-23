import 'package:e_commerce_task1/logic/bindings/auth_binding.dart';
import 'package:e_commerce_task1/logic/bindings/main_binding.dart';
import 'package:e_commerce_task1/logic/bindings/product_binding.dart';
import 'package:e_commerce_task1/view/screens/auth/forgot_password.dart';
import 'package:e_commerce_task1/view/screens/auth/login_screen.dart';
import 'package:e_commerce_task1/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_task1/view/screens/main_screen.dart';
import 'package:e_commerce_task1/view/welcome_screen.dart';
import 'package:get/get.dart';


class AppRoutes {
  //InitialRoutes

  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => const SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        ProductBinding(),

        AuthBinding(),
        MainBinding(),

      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcome_screen';
  static const loginScreen = '/login_screen';
  static const signUpScreen = '/signUp_screen';
  static const forgotPasswordScreen = '/forgot_password_screen';
  static const mainScreen = '/main_screen';
}
