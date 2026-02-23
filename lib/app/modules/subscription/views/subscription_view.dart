import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/common/widgets/sweny_button.dart';

import '../controllers/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBase,
      appBar: AppBar(
        backgroundColor: AppColors.bgBase,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ),
        title: Text(
          'Pilih Plan',
          style: GoogleFonts.syne(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Tingkatkan\npengalamanmu',
              style: GoogleFonts.syne(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Pilih plan yang sesuai dengan kebutuhanmu.',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 28),

            // Plan cards
            ...controller.plans.map(
              (plan) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _PlanCard(plan: plan, controller: controller),
              ),
            ),

            const SizedBox(height: 8),

            // Footer note
            Center(
              child: Text(
                'Semua plan termasuk enkripsi data & privasi penuh.\nBatalkan kapan saja.',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 11,
                  color: AppColors.textHint,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.plan, required this.controller});

  final SubscriptionPlan plan;
  final SubscriptionController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedPlan.value == plan.name;
      final isLoading = controller.isLoadingPlan.value == plan.name;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: plan.isPopular
                ? AppColors.primary.withValues(alpha: 0.6)
                : isSelected
                    ? plan.accentColor.withValues(alpha: 0.5)
                    : AppColors.border,
            width: plan.isPopular ? 1.5 : 1.0,
          ),
          boxShadow: plan.isPopular
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Popular badge
              if (plan.isPopular) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientPrimary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '⭐ Paling Populer',
                    style: GoogleFonts.dmSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
              ],

              // Plan name + price row
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plan.name,
                          style: GoogleFonts.syne(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              plan.price,
                              style: GoogleFonts.syne(
                                fontSize: plan.price == 'Gratis' ? 22 : 22,
                                fontWeight: FontWeight.w800,
                                color: plan.accentColor == const Color(0xFF4A6580)
                                    ? AppColors.textSecondary
                                    : plan.accentColor,
                              ),
                            ),
                            if (plan.price != 'Gratis') ...[
                              const SizedBox(width: 4),
                              Text(
                                '/ ${plan.period}',
                                style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  color: AppColors.textHint,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Check icon if selected
                  if (isSelected)
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: AppColors.success,
                        size: 16,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Divider
              Container(
                height: 1,
                color: AppColors.border,
              ),
              const SizedBox(height: 16),

              // Features list
              ...plan.features.map(
                (f) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        size: 16,
                        color: plan.isPopular
                            ? AppColors.primaryLight
                            : AppColors.success,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          f,
                          style: GoogleFonts.dmSans(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // CTA Button
              SwenyButton(
                label: plan.cta,
                onPressed: isLoading
                    ? null
                    : () => controller.selectPlan(plan.name),
                isLoading: isLoading,
                variant: plan.isPopular
                    ? SwenyButtonVariant.primary
                    : SwenyButtonVariant.secondary,
                size: SwenyButtonSize.medium,
              ),
            ],
          ),
        ),
      );
    });
  }
}
