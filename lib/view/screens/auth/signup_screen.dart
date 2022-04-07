import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/auth/auth_button_widget.dart';
import 'package:e_commerce_task1/view/widgets/auth/auth_text_from_field_widget.dart';
import 'package:e_commerce_task1/view/widgets/auth/check_box_widget.dart';
import 'package:e_commerce_task1/view/widgets/auth/container_under_widget.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _userNameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _userNameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 25, end: 25, top: 40),
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
                            color: Get.isDarkMode ? Colors.black : Colors.white,
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
                        validator: () {},
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
                        validator: () {},
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
                      AuthTextFromFieldWidget(
                        controller: _passwordTextController,
                        obscureText: true,
                        validator: () {},
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assets/images/lock.png')
                            : const Icon(
                                Icons.lock,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: const Text(''),
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CheckBoxWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthButtonWidget(text: 'SIGN UP', onPressed: () {}),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              ContainerUnderWidget(
                text: 'Already have an Account? ',
                textType: 'Log in',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
