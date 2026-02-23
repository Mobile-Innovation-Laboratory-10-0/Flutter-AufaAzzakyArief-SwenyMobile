import 'package:get/get.dart';

class SplashController extends GetxController {
  // Animation observables
  var logoOpacity = 0.0.obs;
  var logoScale = 0.7.obs;
  var textOpacity = 0.0.obs;
  var progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _startAnimations();
  }

  void _startAnimations() async {
    // Step 1: Logo fade in + scale up
    await Future.delayed(const Duration(milliseconds: 300));
    logoOpacity.value = 1.0;
    logoScale.value = 1.0;

    // Step 2: Text fade in
    await Future.delayed(const Duration(milliseconds: 600));
    textOpacity.value = 1.0;

    // Step 3: Progress bar animation
    await Future.delayed(const Duration(milliseconds: 400));
    _animateProgress();

    // Step 4: Navigate to onboarding / home
    await Future.delayed(const Duration(milliseconds: 2200));
    _navigateNext();
  }

  void _animateProgress() async {
    for (int i = 0; i <= 100; i += 2) {
      await Future.delayed(const Duration(milliseconds: 30));
      progress.value = i / 100;
    }
  }

  void _navigateNext() {
    // Ganti '/onboarding' dengan route tujuan kamu
    Get.offAllNamed('/onboarding');
  }
}
