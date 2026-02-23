import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  var isLoading = false.obs;
  var isEmailSent = false.obs;
  var emailError = RxnString();

  bool _validateEmail() {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email tidak boleh kosong';
      return false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Format email tidak valid';
      return false;
    }
    emailError.value = null;
    return true;
  }

  void sendResetLink() async {
    if (!_validateEmail()) return;

    isLoading.value = true;
    // TODO: Integrate Firebase Auth sendPasswordResetEmail
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    isEmailSent.value = true;
  }

  void goBack() => Get.back();

  void resend() {
    isEmailSent.value = false;
    emailController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
