import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var nameError = RxnString();
  var emailError = RxnString();
  var passwordError = RxnString();
  var confirmPasswordError = RxnString();

  bool _validateInputs() {
    bool valid = true;

    final name = nameController.text.trim();
    if (name.isEmpty) {
      nameError.value = 'Nama tidak boleh kosong';
      valid = false;
    } else if (name.length < 2) {
      nameError.value = 'Nama minimal 2 karakter';
      valid = false;
    } else {
      nameError.value = null;
    }

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
    } else if (password.length < 8) {
      passwordError.value = 'Password minimal 8 karakter';
      valid = false;
    } else {
      passwordError.value = null;
    }

    final confirmPassword = confirmPasswordController.text;
    if (confirmPassword.isEmpty) {
      confirmPasswordError.value = 'Konfirmasi password tidak boleh kosong';
      valid = false;
    } else if (confirmPassword != password) {
      confirmPasswordError.value = 'Password tidak cocok';
      valid = false;
    } else {
      confirmPasswordError.value = null;
    }

    return valid;
  }

  void register() async {
    if (!_validateInputs()) return;

    isLoading.value = true;
    // TODO: Replace with Firebase Auth createUserWithEmailAndPassword
    await Future.delayed(const Duration(milliseconds: 1200));
    isLoading.value = false;

    Get.offAllNamed(Routes.HOME);

    Future.delayed(const Duration(milliseconds: 300), () {
      Get.snackbar(
        'Akun Berhasil Dibuat! 🎉',
        'Selamat bergabung di SWENY, ${nameController.text.trim()}!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.bgCard,
        colorText: Colors.white,
        borderRadius: 14,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
        icon: const Icon(Icons.celebration_outlined, color: AppColors.success),
      );
    });
  }

  void goToLogin() => Get.back();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
