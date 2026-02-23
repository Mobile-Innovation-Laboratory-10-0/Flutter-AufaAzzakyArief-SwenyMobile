import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/modules/home/controllers/home_controller.dart';
import 'package:sweny/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  // Mock user data — replace with Firebase Auth data
  final userName = 'Developer SWENY'.obs;
  final userEmail = 'developer@sweny.app'.obs;
  final userInitials = 'DS'.obs;
  final currentPlan = 'Free'.obs;
  final memberSince = 'Februari 2025'.obs;

  void editProfile() {
    Get.snackbar(
      'Coming Soon',
      'Fitur edit profil akan segera hadir!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.bgCard,
      colorText: Colors.white,
      borderRadius: 14,
      margin: const EdgeInsets.all(16),
      icon: const Icon(Icons.construction_outlined, color: AppColors.warning),
    );
  }

  void openNotificationSettings() {
    Get.snackbar(
      'Coming Soon',
      'Pengaturan notifikasi akan segera hadir!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.bgCard,
      colorText: Colors.white,
      borderRadius: 14,
      margin: const EdgeInsets.all(16),
      icon: const Icon(
        Icons.notifications_outlined,
        color: AppColors.primaryLight,
      ),
    );
  }

  void goToSubscription() => Get.toNamed(Routes.SUBSCRIPTION);

  void openAbout() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.gradientPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/images/sweny_logo.png'),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'SWENY',
                style: GoogleFonts.syne(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Versi 1.0.0',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  color: AppColors.textHint,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'AI Mental Health Companion\nuntuk Developer Indonesia',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.bgElevated,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '© 2025 SWENY Labs\nTelkom University · Bandung Techno Park',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: AppColors.textHint,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bgElevated,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                  ),
                  child: Text(
                    'Tutup',
                    style: GoogleFonts.dmSans(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Delegate ke HomeController untuk consistent logout dialog
  void showLogoutDialog() => Get.find<HomeController>().showLogoutDialog();
}
