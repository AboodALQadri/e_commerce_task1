import 'package:e_commerce_task1/logic/controllers/auth_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/auth/auth_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_from_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _emailTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'if you want to recover your Account , then please provide your Email ID to below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 300,
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
                    height: 50,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthButtonWidget(
                        text: 'SEND',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            String email = _emailTextController.text.trim();

                            controller.resetPassword(email);
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
