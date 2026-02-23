import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweny/app/common/theme/app_colors.dart';

class SubscriptionPlan {
  const SubscriptionPlan({
    required this.name,
    required this.price,
    required this.period,
    required this.features,
    required this.cta,
    required this.isPopular,
    required this.accentColor,
  });

  final String name;
  final String price;
  final String period;
  final List<String> features;
  final String cta;
  final bool isPopular;
  final Color accentColor;
}

class SubscriptionController extends GetxController {
  var selectedPlan = ''.obs;
  var isLoadingPlan = ''.obs; // plan name yang sedang loading

  final plans = const [
    SubscriptionPlan(
      name: 'Free',
      price: 'Gratis',
      period: 'selamanya',
      features: [
        'Burnout score harian',
        '5 percakapan/hari',
        'Insights dasar mingguan',
        'Notifikasi istirahat',
      ],
      cta: 'Mulai Gratis',
      isPopular: false,
      accentColor: Color(0xFF4A6580),
    ),
    SubscriptionPlan(
      name: 'Individual',
      price: 'Rp 29.000',
      period: 'per bulan',
      features: [
        'Semua fitur Free',
        'Percakapan tak terbatas',
        'Insights mendalam 30 hari',
        'Analisis trend burnout',
        'Export laporan PDF',
      ],
      cta: 'Coba 7 Hari Gratis',
      isPopular: true,
      accentColor: Color(0xFF2D7DD2),
    ),
    SubscriptionPlan(
      name: 'Enterprise',
      price: 'Rp 99.000',
      period: 'per bulan',
      features: [
        'Semua fitur Individual',
        'Dashboard tim real-time',
        'API Integration',
        'Priority support 24/7',
        'Custom onboarding tim',
      ],
      cta: 'Hubungi Sales',
      isPopular: false,
      accentColor: Color(0xFFFFB547),
    ),
  ];

  void selectPlan(String planName) async {
    if (isLoadingPlan.value.isNotEmpty) return; // prevent double tap

    if (planName == 'Free') {
      selectedPlan.value = 'Free';
      Get.back();
      _showSnackbar(
        title: 'Plan Free Aktif',
        message: 'Kamu menggunakan plan Free. Upgrade kapan saja!',
        icon: Icons.check_circle_outline,
        iconColor: AppColors.success,
      );
    } else if (planName == 'Enterprise') {
      _showSnackbar(
        title: 'Kami Akan Menghubungi',
        message: 'Tim sales kami akan segera menghubungi kamu dalam 1x24 jam.',
        icon: Icons.mail_outline_rounded,
        iconColor: AppColors.primaryLight,
        duration: 4,
      );
    } else {
      // Individual — simulasi proses pembayaran
      isLoadingPlan.value = planName;
      await Future.delayed(const Duration(milliseconds: 1500));
      isLoadingPlan.value = '';
      selectedPlan.value = planName;

      Get.back();
      _showSnackbar(
        title: 'Trial Dimulai! 🎉',
        message: '7 hari trial Individual gratis. Nikmati semua fitur premium!',
        icon: Icons.star_rounded,
        iconColor: AppColors.warning,
        duration: 4,
      );
    }
  }

  void _showSnackbar({
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
    int duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.bgCard,
      colorText: Colors.white,
      borderRadius: 14,
      margin: const EdgeInsets.all(16),
      duration: Duration(seconds: duration),
      icon: Icon(icon, color: iconColor),
    );
  }
}
