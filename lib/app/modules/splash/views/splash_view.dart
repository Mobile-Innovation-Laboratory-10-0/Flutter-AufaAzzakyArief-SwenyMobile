import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splash_controller.dart';
import 'package:sweny/app/common/theme/app_colors.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBase,
      body: Stack(
        children: [
          // Background mesh gradient
          Positioned.fill(child: CustomPaint(painter: _MeshPainter())),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo + glow
                Obx(
                  () => AnimatedOpacity(
                    opacity: controller.logoOpacity.value,
                    duration: const Duration(milliseconds: 800),
                    child: AnimatedScale(
                      scale: controller.logoScale.value,
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutBack,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outer glow
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  AppColors.primary.withOpacity(0.2),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          // Pulse ring
                          const _PulseRing(),
                          // Logo asset
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Image.asset(
                              'assets/images/sweny_logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Brand name + tagline
                Obx(
                  () => AnimatedOpacity(
                    opacity: controller.textOpacity.value,
                    duration: const Duration(milliseconds: 700),
                    child: Column(
                      children: [
                        Text(
                          'SWENY',
                          style: GoogleFonts.syne(
                            fontSize: 38,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            letterSpacing: 6,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 48,
                          height: 1.5,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.primaryLight,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Your AI Coding Companion',
                          style: GoogleFonts.dmSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryLight,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom progress bar
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Obx(
              () => AnimatedOpacity(
                opacity: controller.textOpacity.value,
                duration: const Duration(milliseconds: 600),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: controller.progress.value,
                          backgroundColor: AppColors.bgElevated,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primaryLight,
                          ),
                          minHeight: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'SWENY Labs · 2025',
                      style: GoogleFonts.dmSans(
                        fontSize: 11,
                        color: AppColors.textHint,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Pulse ring animasi
class _PulseRing extends StatefulWidget {
  const _PulseRing();

  @override
  State<_PulseRing> createState() => _PulseRingState();
}

class _PulseRingState extends State<_PulseRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    _scale = Tween<double>(
      begin: 0.8,
      end: 1.6,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _opacity = Tween<double>(
      begin: 0.5,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => Transform.scale(
        scale: _scale.value,
        child: Opacity(
          opacity: _opacity.value,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryLight, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}

// Mesh background painter
class _MeshPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader =
          RadialGradient(
            colors: [
              AppColors.primaryDark.withOpacity(0.6),
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.15, size.height * 0.2),
              radius: size.width * 0.5,
            ),
          );
    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.2),
      size.width * 0.5,
      paint1,
    );

    final paint2 = Paint()
      ..shader =
          RadialGradient(
            colors: [AppColors.bgCard.withOpacity(0.8), Colors.transparent],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.85, size.height * 0.8),
              radius: size.width * 0.45,
            ),
          );
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.8),
      size.width * 0.45,
      paint2,
    );

    final paint3 = Paint()
      ..shader =
          RadialGradient(
            colors: [AppColors.primary.withOpacity(0.08), Colors.transparent],
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width * 0.5, size.height * 0.45),
              radius: size.width * 0.4,
            ),
          );
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.45),
      size.width * 0.4,
      paint3,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
