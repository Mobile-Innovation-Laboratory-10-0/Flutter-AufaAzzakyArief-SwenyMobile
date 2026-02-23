import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var emailError = RxnString();
  var passwordError = RxnString();

  bool _validateInputs() {
    bool valid = true;

    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email tidak boleh kosong';
      valid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Format email tidak valid';
      valid = false;
    } else {
      emailError.value = null;
    }

    final password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = 'Password tidak boleh kosong';
      valid = false;
    } else if (password.length < 6) {
      passwordError.value = 'Password minimal 6 karakter';
      valid = false;
    } else {
      passwordError.value = null;
    }

    return valid;
  }

  void login() async {
    if (!_validateInputs()) return;

    isLoading.value = true;
    // TODO: Replace with Firebase Auth
    await Future.delayed(const Duration(milliseconds: 1200));
    isLoading.value = false;

    Get.offAllNamed(Routes.HOME);

    // Snackbar welcome setelah navigate
    Future.delayed(const Duration(milliseconds: 300), () {
      Get.snackbar(
        'Berhasil Masuk! 👋',
        'Selamat datang kembali di SWENY.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.bgCard,
        colorText: Colors.white,
        borderRadius: 14,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.check_circle_outline, color: AppColors.success),
      );
    });
  }

  void loginWithGoogle() async {
    isLoading.value = true;
    // TODO: Replace with Google Sign-In package
    await Future.delayed(const Duration(milliseconds: 1200));
    isLoading.value = false;

    Get.offAllNamed(Routes.HOME);

    Future.delayed(const Duration(milliseconds: 300), () {
      Get.snackbar(
        'Berhasil Masuk! 👋',
        'Masuk via Google berhasil.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.bgCard,
        colorText: Colors.white,
        borderRadius: 14,
        margin: const EdgeInsets.all(16),
        icon: const Icon(Icons.check_circle_outline, color: AppColors.success),
      );
    });
  }

  void goToRegister() => Get.toNamed(Routes.REGISTER);

  void goToForgotPassword() => Get.toNamed(Routes.FORGOT_PASSWORD);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
