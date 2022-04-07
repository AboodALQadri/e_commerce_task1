import 'package:e_commerce_task1/routes/routes.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/screens/auth/login_screen.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: TextUtils(
                        fontWeight: FontWeight.bold,
                        text: 'Welcome',
                        color: Colors.white,
                        fontSize: 35,
                        underLine: TextDecoration.none,

                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          TextUtils(
                            text: 'Uzay',
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            underLine: TextDecoration.none,

                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextUtils(
                            text: 'Shop',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 35,
                            underLine: TextDecoration.none,

                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get.to(LoginScreen());
                      // Get.toNamed(Routes.loginScreen);
                      // Get.off(LoginScreen());
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: const TextUtils(
                        text: 'Get Start',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      underLine: TextDecoration.none,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtils(
                        text: 'Don\'t have an Account?',
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: const TextUtils(
                          text: 'SignUp',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          underLine: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
