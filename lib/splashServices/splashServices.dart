import 'dart:async';
import 'package:cart/view/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/signin/signIn.dart';


class SplashService {
  void isLogin(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final User? user = auth.currentUser;

      Timer(const Duration(seconds: 4), () {
        if (user != null) {
          Get.off(() => const HomeScreen());
        } else {
          Get.off(() => const SignIn());
        }
      });
    } catch (e) {
      Get.snackbar("Error", "Authentication check failed: $e",
          snackPosition: SnackPosition.BOTTOM);
      Timer(const Duration(seconds: 4), () {
        Get.off(() => const SignIn());
      });
    }
  }
}