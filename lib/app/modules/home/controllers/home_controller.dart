import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/routes/app_pages.dart';

class HomeController extends GetxController {
  // ── Bottom Nav ──────────────────────────────────────
  var currentTab = 0.obs;

  void changeTab(int index) => currentTab.value = index;

  void goToChat() => changeTab(1);
  void goToInsights() => changeTab(2);

  // ── Mock User Data ──────────────────────────────────
  // Replace with real Firebase Auth + Firestore data later
  final userName = 'Developer'.obs;
  final userEmail = 'developer@sweny.app'.obs;
  final userInitials = 'DV'.obs;
  final currentPlan = 'Free'.obs;

  // ── Mock Burnout Metrics ────────────────────────────
  final burnoutScore = 34.obs;       // 0-100 (lower = healthier)
  final codingHoursToday = 6.5.obs;  // hours today
  final currentStreak = 7.obs;       // days
  final energyLevel = 72.obs;        // 0-100
  final focusScore = 81.obs;         // 0-100

  // ── Computed Properties ─────────────────────────────
  String get greeting {
    final h = DateTime.now().hour;
    if (h < 10) return 'Selamat pagi';
    if (h < 15) return 'Selamat siang';
    if (h < 18) return 'Selamat sore';
    return 'Selamat malam';
  }

  String get burnoutLabel {
    final s = burnoutScore.value;
    if (s < 30) return 'Sangat Sehat';
    if (s < 50) return 'Sehat';
    if (s < 70) return 'Perlu Perhatian';
    return 'Burnout Tinggi';
  }

  Color get burnoutColor {
    final s = burnoutScore.value;
    if (s < 30) return AppColors.success;
    if (s < 50) return AppColors.primary;
    if (s < 70) return AppColors.warning;
    return AppColors.error;
  }

  Color get burnoutBg {
    final s = burnoutScore.value;
    if (s < 30) return AppColors.success.withValues(alpha: 0.1);
    if (s < 50) return AppColors.primary.withValues(alpha: 0.1);
    if (s < 70) return AppColors.warning.withValues(alpha: 0.1);
    return AppColors.error.withValues(alpha: 0.1);
  }

  // ── Navigation ──────────────────────────────────────
  void goToSubscription() => Get.toNamed(Routes.SUBSCRIPTION);

  // ── Logout Dialog ────────────────────────────────────
  void showLogoutDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  color: AppColors.error,
                  size: 24,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Logout?',
                style: GoogleFonts.syne(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Kamu akan keluar dari akun SWENY.',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.border),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        'Batal',
                        style: GoogleFonts.dmSans(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.offAllNamed(Routes.ONBOARDING);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                      ),
                      child: Text(
                        'Logout',
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
