import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/common/widgets/sweny_button.dart';
import 'package:sweny/app/common/widgets/sweny_text_field.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
              const SizedBox(height: 16),

              // Back button
              IconButton(
                onPressed: controller.goToLogin,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 24),

              // Heading
              Text(
                'Buat akun\nbaru',
                style: GoogleFonts.syne(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Mulai perjalananmu bersama SWENY',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 36),

              // Name field
              Obx(
                () => SwenyTextField(
                  label: 'Nama Lengkap',
                  hint: 'Nama kamu',
                  controller: controller.nameController,
                  prefixIcon: Icons.person_outline_rounded,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  errorText: controller.nameError.value,
                ),
              ),
              const SizedBox(height: 16),

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
                  hint: 'Minimal 8 karakter',
                  controller: controller.passwordController,
                  prefixIcon: Icons.lock_outline_rounded,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
                  errorText: controller.passwordError.value,
                ),
              ),
              const SizedBox(height: 16),

              // Confirm password field
              Obx(
                () => SwenyTextField(
                  label: 'Konfirmasi Password',
                  hint: 'Ulangi password kamu',
                  controller: controller.confirmPasswordController,
                  prefixIcon: Icons.lock_outline_rounded,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  errorText: controller.confirmPasswordError.value,
                  onSubmitted: (_) => controller.register(),
                ),
              ),
              const SizedBox(height: 32),

              // Register button
              Obx(
                () => SwenyButton(
                  label: 'Buat Akun',
                  onPressed:
                      controller.isLoading.value ? null : controller.register,
                  isLoading: controller.isLoading.value,
                  size: SwenyButtonSize.large,
                ),
              ),
              const SizedBox(height: 36),

              // Login link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    TextButton(
                      onPressed: controller.goToLogin,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 4),
                        minimumSize: const Size(0, 36),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Masuk',
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
