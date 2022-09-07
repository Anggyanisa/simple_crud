import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_crud/modul/template/view/template_button.dart';

import '../../../constant/style.dart';

class CustomGetXFunction {
  CustomGetXFunction.showSnackbar(String message, {var icon}) {
    Get.snackbar("", message,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
        duration: const Duration(seconds: 3),
        showProgressIndicator: true,
        margin: const EdgeInsets.all(0),
        icon: icon);
  }

  CustomGetXFunction.showErrorSnackbar(
      {String message =
          'Terjadi kesalahan server, harap tunggu beberapa saat lagi'}) {
    Get.snackbar("", message,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
        duration: const Duration(seconds: 3),
        showProgressIndicator: true,
        margin: const EdgeInsets.all(0),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ));
  }

  CustomGetXFunction.showProgressDialog({bool dismissable = true}) {
    Get.defaultDialog(
        title: '',
        content: Center(
            child: Column(
          children: [
            const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(strokeWidth: 8)),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Sedang proses, harap ditunggu...",
              style: TextStyle(
                  fontSize: CustomStyle.fontSizeTitle,
                  color: CustomStyle.fontColorBlack,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            )
          ],
        )),
        contentPadding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
        barrierDismissible: dismissable);
  }

  CustomGetXFunction.successDialog(String title, String content) {
    Get.defaultDialog(
        title: "",
        contentPadding: const EdgeInsets.only(left: 18, right: 18, bottom: 28),
        content: Column(
          children: [
            Icon(
              Icons.check_circle,
              color: CustomStyle.color3,
              size: 96,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: CustomStyle.fontSizeTitle + 2,
                  fontWeight: FontWeight.w600,
                  color: CustomStyle.fontColorBlack),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              content,
              style: TextStyle(
                  fontSize: CustomStyle.fontSizeSmall,
                  fontWeight: FontWeight.w400,
                  color: CustomStyle.fontColorGrey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
        cancel: TemplateButton(
          onClick: () => Get.back(),
          label: "Tutup",
          color: CustomStyle.color3,
          borderColor: CustomStyle.color3,
          contentColor: Colors.white,
          expand: true,
          radius: 12,
        ));
  }
}
