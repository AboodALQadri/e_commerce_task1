import 'package:e_commerce_task1/logic/controllers/auth_controller.dart';
import 'package:e_commerce_task1/routes/routes.dart';
import 'package:e_commerce_task1/utils/my_string.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/auth/auth_button_widget.dart';
import 'package:e_commerce_task1/view/widgets/auth/auth_text_from_field_widget.dart';
import 'package:e_commerce_task1/view/widgets/auth/check_box_widget.dart';
import 'package:e_commerce_task1/view/widgets/auth/container_under_widget.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidateHelper {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final controller = Get.find<AuthController>();

  final fromKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   _userNameTextController = TextEditingController();
  //   _emailTextController = TextEditingController();
  //   _passwordTextController = TextEditingController();
  // }
  //
  // @override
  // void dispose() {
  //   _userNameTextController.dispose();
  //   _emailTextController.dispose();
  //   _passwordTextController.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                                text: 'SIGN',
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                underLine: TextDecoration.none,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              TextUtils(
                                text: 'UP',
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
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
                            controller: _userNameTextController,
                            obscureText: false,
                            validator: (value) {
                              if (value.toString().length < 2 ||
                                  !RegExp(validationName).hasMatch(value)) {
                                return ' Enter Invalid Name';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/user.png')
                                : const Icon(
                                    Icons.person,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: const Text(''),
                            hintText: 'User Name',
                          ),
                          const SizedBox(
                            height: 20,
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
                                ? Image.asset('assets/images/email.png')
                                : const Icon(
                                    Icons.email,
                                    color: pinkClr,
                                    size: 30,
                                  ),
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
                                    ? Image.asset('assets/images/lock.png')
                                    : const Icon(
                                        Icons.lock,
                                        color: pinkClr,
                                        size: 30,
                                      ),
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
                          const SizedBox(
                            height: 20,
                          ),
                          CheckBoxWidget(),
                          const SizedBox(
                            height: 50,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthButtonWidget(
                                text: 'SIGN UP',
                                onPressed: () {
                                  if (controller.isCheckBox == false) {
                                    Get.snackbar(
                                      'Check Box',
                                      'Please Accept terms & conditions',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );
                                  } else if (fromKey.currentState!.validate()) {
                                    String name =
                                        _userNameTextController.text.trim();
                                    String email =
                                        _emailTextController.text.trim();
                                    String password =
                                        _passwordTextController.text;

                                    controller.signUpUsingFirebase(
                                      name: name,
                                      email: email,
                                      password: password,
                                    );
                                    controller.isCheckBox == true;

                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnderWidget(
                  text: 'Already have an Account? ',
                  textType: 'Log in',
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
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
