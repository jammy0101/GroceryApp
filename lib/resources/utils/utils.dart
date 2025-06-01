import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../color/colors.dart';



class Utils {

  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor:  AppColor.blueColor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor:  AppColor.blueColor,
      gravity: ToastGravity.CENTER,
    );
  }

  static snackBar(String title ,String message){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
    );
  }

}