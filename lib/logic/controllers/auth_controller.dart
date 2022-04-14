import 'package:e_commerce_task1/model/facebook_model.dart';
import 'package:e_commerce_task1/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;

  bool isCheckBox = false;

  var displayUserName = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var displayUserPhoto = '';
  FacebookModel? facebookModel;

  void visibility() {
    isVisibility = !isVisibility;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();

      Get.offNamed(Routes.loginScreen);
      //
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = 'Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = 'Account already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'ERROR!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = auth.currentUser!.displayName!;
      });

      update();

      Get.offNamed(Routes.mainScreen);
      //
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = 'Invalid Password .. Please try again!..';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'ERROR!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();

      Get.back();
      Get.snackbar(
        'Verify Send',
        'Check your Email to verify a new password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      //
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = 'Invalid Password .. Please try again!..';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'ERROR!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;

      update();

      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'ERROR!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void facebookSignUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();

      facebookModel = FacebookModel.fromJson(data);

      print('////////////////////////////////////////////////////////');
      print('${facebookModel!.email}');
      print('${facebookModel!.email}');
      print('///////////////////////////////////////////////////////////');

      update();

      Get.offNamed(Routes.mainScreen);
    }
  }

  void signOutFromApp() {}
}
