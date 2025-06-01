import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../models/userModel.dart';
import '../../resources/color/colors.dart';
import '../../resources/components/roundButton.dart';
import '../../resources/components/roundButton2.dart';
import '../../viewModel/firebase_services/firebase_services.dart';
import '../home_screen/home_screen.dart';
import '../resgistration/registration.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final SignInController controller = Get.put(SignInController());
  final formKey2 = GlobalKey<FormState>();
  final FirebaseServices controller = Get.put(FirebaseServices());

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
                'Welcome Back!'.tr,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Please enter your account here'.tr,
                style: const TextStyle(fontSize: 20,color: AppColor.blackColor),
              ),
              const SizedBox(height: 15),
              Form(
                key: formKey2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
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
                    const SizedBox(height: 20),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // perform Forgot Password
                      },
                      child:  Text(
                        'Forgot password?'.tr,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Obx(() => RoundButton(
                height: 60,
                width: 370,
                title: 'LOGIN'.tr,
                loading: controller.loading2.value,
                onPress: () {
                  if(formKey2.currentState!.validate()){
                    controller.loading2.value = true; // Show loading
                    final user = UserModel(
                      email: controller.emailController.text,
                      password: controller.passwordController.text,
                    );
                    FirebaseServices().signInUser(user, (){
                      controller.loading2.value = false;
                      Get.to(() => const HomeScreen());
                    });
                  }
                },
                roundButton: AppColor.blueColor,
              )),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              RoundButton2(
                height: 60,
                width: 370,
                title: 'Google'.tr,
                loading: controller.loading2.value,
                onPress: () {
                  // Perform Google login
                },
                buttonColor2: AppColor.blueColor,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?".tr,
                    style: const TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(() => const Registration());
                    },
                    child:  Text(
                      'SignUp'.tr,
                      style:  const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.blueColor),
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

