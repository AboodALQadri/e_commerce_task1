import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button_widget.dart';
import '../../widgets/auth/auth_text_from_field_widget.dart';
import '../../widgets/auth/container_under_widget.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  final controller = Get.find<AuthController>();

  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25, end: 25, top: 30),
                    child: Form(
                      key: fromKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextUtils(
                                text: 'LOG',
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                underLine: TextDecoration.none,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              TextUtils(
                                text: 'IN',
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                underLine: TextDecoration.none,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          AuthTextFromFieldWidget(
                            controller: _emailTextController,
                            obscureText: false,
                            validator: (value) {
                              if (!RegExp(validationEmail).hasMatch(value)) {
                                return ' Enter Invalid Email';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? const Icon(
                                    Icons.email,
                                    color: pinkClr,
                                    size: 30,
                                  )
                                : Image.asset('assets/images/email.png'),
                            suffixIcon: const Text(''),

                            hintText: 'Email',

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthTextFromFieldWidget(
                                controller: _passwordTextController,
                                obscureText:
                                    controller.isVisibility ? false : true,
                                validator: (value) {
                                  if (value.toString().length < 5) {
                                    return 'Password should be longer than 5 character';
                                  } else {
                                    return null;
                                  }
                                },
                                prefixIcon: Get.isDarkMode
                                    ? const Icon(
                                        Icons.lock,
                                        color: pinkClr,
                                        size: 30,
                                      )
                                    : Image.asset('assets/images/lock.png'),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        ),
                                ),
                                hintText: 'Password',
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPasswordScreen);
                              },
                              child: TextUtils(
                                text: 'Forgot Password?',
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                underLine: TextDecoration.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthButtonWidget(
                                text: 'LOG IN',
                                onPressed: () {
                                  if (fromKey.currentState!.validate()) {
                                    String email =
                                        _emailTextController.text.trim();
                                    String password =
                                        _passwordTextController.text;

                                    controller.logInUsingFirebase(
                                        email: email, password: password);
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextUtils(
                            text: 'OR',
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            underLine: TextDecoration.none,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child:
                                    Image.asset('assets/images/facebook.png'),
                                onTap: () {
                                  controller.facebookSignUpApp();
                                },
                              ),
                              const SizedBox(width: 10),
                              GetBuilder<AuthController>(
                                builder: (_) {
                                  return InkWell(
                                    child:
                                        Image.asset('assets/images/google.png'),
                                    onTap: () {
                                      controller.googleSignUpApp();
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnderWidget(
                  text: 'Don\'t have an Account?',
                  textType: 'Sign up',
                  onPressed: () {
                    Get.offNamed(Routes.signUpScreen);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
