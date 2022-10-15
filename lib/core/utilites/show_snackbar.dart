import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(
    {String? title, String? message, Color? color, Color? textColor}) {
  Get.snackbar(
    title ?? "",
    message ?? "",
    backgroundColor: color,
    colorText: textColor ?? Colors.white,
    borderRadius: 8,
  );
}
