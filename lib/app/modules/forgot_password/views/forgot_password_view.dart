import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/common/widgets/sweny_button.dart';
import 'package:sweny/app/common/widgets/sweny_text_field.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBase,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Obx(
            () => controller.isEmailSent.value
                ? _EmailSentState(controller: controller)
                : _InputState(controller: controller),
          ),
        ),
      ),
    );
  }
}

class _InputState extends StatelessWidget {
  const _InputState({required this.controller});

  final ForgotPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        // Back button
        IconButton(
          onPressed: controller.goBack,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textSecondary,
            size: 20,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(height: 40),

        // Icon
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha:0.12),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.primary.withValues(alpha:0.25),
            ),
          ),
          child: const Icon(
            Icons.key_outlined,
            color: AppColors.primaryLight,
            size: 28,
          ),
        ),
        const SizedBox(height: 24),

        // Heading
        Text(
          'Lupa password?',
          style: GoogleFonts.syne(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Masukkan email kamu dan kami akan kirimkan link untuk reset password.',
          style: GoogleFonts.dmSans(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.6,
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
            textInputAction: TextInputAction.done,
            errorText: controller.emailError.value,
            onSubmitted: (_) => controller.sendResetLink(),
          ),
        ),
        const SizedBox(height: 32),

        // Send button
        Obx(
          () => SwenyButton(
            label: 'Kirim Reset Link',
            onPressed: controller.isLoading.value
                ? null
                : controller.sendResetLink,
            isLoading: controller.isLoading.value,
            size: SwenyButtonSize.large,
          ),
        ),
        const Spacer(),

        // Back to login link
        Center(
          child: TextButton.icon(
            onPressed: controller.goBack,
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 16,
              color: AppColors.textSecondary,
            ),
            label: Text(
              'Kembali ke Login',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _EmailSentState extends StatelessWidget {
  const _EmailSentState({required this.controller});

  final ForgotPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Success icon
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha:0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.success.withValues(alpha:0.3),
              width: 1,
            ),
          ),
          child: const Icon(
            Icons.mark_email_read_outlined,
            color: AppColors.success,
            size: 44,
          ),
        ),
        const SizedBox(height: 32),

        Text(
          'Cek email kamu!',
          style: GoogleFonts.syne(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Obx(
          () => Text(
            'Kami sudah kirim link reset password ke\n${controller.emailController.text.trim()}',
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 48),

        // Back to login
        SwenyButton(
          label: 'Kembali ke Login',
          onPressed: controller.goBack,
          size: SwenyButtonSize.large,
        ),
        const SizedBox(height: 16),

        // Resend
        SwenyButton(
          label: 'Kirim ulang',
          onPressed: controller.resend,
          variant: SwenyButtonVariant.ghost,
          size: SwenyButtonSize.medium,
        ),
      ],
    );
  }
}
