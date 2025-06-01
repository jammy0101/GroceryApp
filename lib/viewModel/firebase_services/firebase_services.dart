import 'package:cart/models/userModel.dart';
import 'package:cart/resources/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseServices extends GetxController{

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();



  // State Variables
  var loading = false.obs;   // For authentication actions
  var loading2 = false.obs;  // For registration actions
  var loading3 = false.obs;  // For profile update
  var isPasswordVisible = false.obs;
  var isPasswordVisible2 = false.obs;




  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isPasswordVisible2.value = !isPasswordVisible2.value;
  }



  /*---------------------Authentication Field---------------------*/



  /// Register User
  Future<void> registerUser(UserModel user, VoidCallback onSuccess) async {
    try {
      loading2.value = true;
      await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      String userId = auth.currentUser?.uid ?? '';

      // Save user data to Firestore
      await saveUserData(user.copyWith(id: userId), () {
        Utils.toastMessage('User Registered Successfully');
      });
      onSuccess();
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.message ?? 'An error occurred');
    } catch (e) {
      Utils.toastMessage('An unexpected error occurred');
    } finally {
      loading2.value = false;
    }
  }


  /// Sign-In User
  Future<void> signInUser(UserModel user, VoidCallback onSuccess) async {
    try {
      loading.value = true;
      await auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      String userId = auth.currentUser?.uid ?? '';

      // Optionally update user data in Firestore
      await saveUserData(user.copyWith(id: userId), () {});

      onSuccess();
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.message ?? 'An error occurred');
    } catch (e) {
      Utils.toastMessage('An unexpected error occurred');
    } finally {
      loading.value = false;
    }
  }

  /*---------------------DATA STORING---------------------*/

  /// Save or Update User Data in Firestore
  Future<void> saveUserData(UserModel user, VoidCallback onSuccess) async {
    if (user.id == null || user.id!.isEmpty) {
      Utils.toastMessage('User ID is missing');
      return;
    }
    await firestore.collection('users_profile').doc(user.id).set(user.toJson(), SetOptions(merge: true))
        .then((_) {
      onSuccess();
      Utils.toastMessage('Successfully Logged In');
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}