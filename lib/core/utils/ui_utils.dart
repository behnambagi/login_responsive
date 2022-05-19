import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiUtil {
  static bool isBig(BuildContext context) =>
      Orientation.landscape == MediaQuery.of(context).orientation;

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}

class SnackBars {
  static basicSnack(String title, String message,
      {Color? bgColor, TextButton? textButton, Icon? icon,bool? snackBottom}) {
    return Get.snackbar(
      title,
      message,
      borderRadius: 17,
      backgroundColor: bgColor ?? Get.theme.splashColor,
      margin: EdgeInsets.symmetric(horizontal: Get.width / 10, vertical: 10),
      mainButton: textButton ??
          TextButton(onPressed: () => Get.back(), child: const Text("Back")),
      snackPosition: snackBottom==true?SnackPosition.BOTTOM:null,
      icon: icon,
      overlayColor: Colors.black45,
      overlayBlur: 1.0,
    );
  }

  static hasError(String message, {String? title}) {
    return basicSnack("Error "+(title??""), message, bgColor: Colors.red.shade400
        ,icon: const Icon(Icons.error));
  }
  static success(String message) {
    return basicSnack("successfully", message, bgColor: CupertinoColors.activeGreen
        ,icon: const Icon(CupertinoIcons.checkmark_alt));
  }
}
