import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/common/widgets/sweny_button.dart';
import 'package:sweny/app/common/widgets/sweny_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBase,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),

              // Logo + brand
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/sweny_logo.png',
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'SWENY',
                      style: GoogleFonts.syne(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Heading
              Text(
                'Selamat datang\nkembali',
                style: GoogleFonts.syne(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Masuk ke akun SWENY kamu',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 36),

              // Email field
              Obx(
                () => SwenyTextField(
                  label: 'Email',
                  hint: 'nama@email.com',
                  controller: controller.emailController,
                  prefixIcon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  errorText: controller.emailError.value,
                ),
              ),
              const SizedBox(height: 16),

              // Password field
              Obx(
                () => SwenyTextField(
                  label: 'Password',
                  hint: 'Masukkan password',
                  controller: controller.passwordController,
                  prefixIcon: Icons.lock_outline_rounded,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  errorText: controller.passwordError.value,
                  onSubmitted: (_) => controller.login(),
                ),
              ),
              const SizedBox(height: 10),

              // Forgot password link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.goToForgotPassword,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 36),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Lupa password?',
                    style: GoogleFonts.dmSans(
                      fontSize: 13,
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Login button
              Obx(
                () => SwenyButton(
                  label: 'Masuk',
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.login,
                  isLoading: controller.isLoading.value,
                  size: SwenyButtonSize.large,
                ),
              ),
              const SizedBox(height: 24),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.border)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'atau',
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        color: AppColors.textHint,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: AppColors.border)),
                ],
              ),
              const SizedBox(height: 24),

              // Google Sign In
              Obx(
                () => SwenyButton(
                  label: 'Lanjut dengan Google',
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.loginWithGoogle,
                  variant: SwenyButtonVariant.outline,
                  size: SwenyButtonSize.large,
                  icon: Icons.g_mobiledata_rounded,
                ),
              ),
              const SizedBox(height: 36),

              // Register link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    TextButton(
                      onPressed: controller.goToRegister,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 4),
                        minimumSize: const Size(0, 36),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Daftar',
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          color: AppColors.primaryLight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
