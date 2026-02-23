import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweny/app/routes/app_pages.dart';

class OnboardingSlide {
  const OnboardingSlide({
    required this.icon,
    required this.title,
    required this.description,
    required this.accentColor,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color accentColor;
}

class OnboardingController extends GetxController {
  final pageController = PageController();

  var currentPage = 0.obs;

  final slides = const [
    OnboardingSlide(
      icon: Icons.monitor_heart_outlined,
      title: 'Detect Burnout\nEarly',
      description:
          'SWENY memantau pola coding kamu — durasi kerja, frekuensi error, dan ritme ketikan — untuk mendeteksi tanda burnout sebelum kamu merasakannya.',
      accentColor: Color(0xFF4DA3FF),
    ),
    OnboardingSlide(
      icon: Icons.psychology_outlined,
      title: 'AI That\nUnderstands You',
      description:
          'Companion AI empatik yang berbicara dalam bahasa Indonesia. Tidak menghakimi, selalu siap mendengarkan, dan memahami tekanan dunia developer.',
      accentColor: Color(0xFF3DDC84),
    ),
    OnboardingSlide(
      icon: Icons.bolt_outlined,
      title: 'Stay in\nFlow',
      description:
          'Intervensi kontekstual yang hadir di waktu yang tepat — tanpa mengganggu fokus kamu. Tetap produktif, tetap sehat.',
      accentColor: Color(0xFFFFB547),
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < slides.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      getStarted();
    }
  }

  void skip() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void getStarted() {
    Get.offAllNamed(Routes.LOGIN);
  }

  bool get isLastPage => currentPage.value == slides.length - 1;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
