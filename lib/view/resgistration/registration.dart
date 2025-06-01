import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/userModel.dart';
import '../../resources/color/colors.dart';
import '../../resources/components/roundButton.dart';
import '../../resources/components/roundButton2.dart';
import '../../viewModel/firebase_services/firebase_services.dart';
import '../home_screen/home_screen.dart';
import '../signin/signin.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //final RegistrationController controller = Get.put(RegistrationController());
  final FirebaseServices controller = Get.put(FirebaseServices());
  final registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height * .9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Registration'.tr,
                style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Please enter your account here'.tr,
                style: TextStyle(fontSize: 20,color: AppColor.blackColor),
              ),
              const SizedBox(height: 20),
              Form(
                key: registrationFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: controller.emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Email or Phone number'.tr,
                          prefixIcon: const Icon(Icons.mail_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email or Phone number please'.tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Obx(() => TextFormField(
                        obscureText: !controller.isPasswordVisible.value,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Password'.tr,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password please'.tr;
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Obx(() => TextFormField(
                        obscureText: !controller.isPasswordVisible2.value,
                        controller: controller.confirmPassword,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password'.tr,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordVisible2.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: controller.toggleConfirmPasswordVisibility,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Confirm Password please'.tr;
                          } else if (value != controller.passwordController.text) {
                            return 'Passwords do not match'.tr;
                          } else {
                            return null;
                          }
                        },
                      )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => RoundButton(
                height: 60,
                width: 380,
                title: 'LOGIN'.tr,
                loading: controller.loading.value,
                onPress: () {
                  if(registrationFormKey.currentState!.validate()){
                    controller.loading.value = true; // Show loading
                    final user = UserModel(
                      email: controller.emailController.text,
                      password: controller.passwordController.text,
                    );
                    FirebaseServices().registerUser(user, (){
                      controller.loading.value = false;
                      Get.to(() => const HomeScreen());
                    });
                  }
                },
                roundButton: AppColor.blueColor,
              )),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'or Continue with'.tr,
                      style: const TextStyle(fontSize: 17,color: AppColor.blackColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              Obx(() => RoundButton2(
                height: 60,
                width: 380,
                title: 'Google'.tr,
                loading: controller.loading3.value,
                buttonColor2: AppColor.blueColor,
                onPress: () {

                  // Perform Google login
                },
              )),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?".tr,
                    style: const TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(() => const SignIn());
                    },
                    child:  Text(
                      'LOGIN'.tr,
                      style:  const TextStyle( fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.blueColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
