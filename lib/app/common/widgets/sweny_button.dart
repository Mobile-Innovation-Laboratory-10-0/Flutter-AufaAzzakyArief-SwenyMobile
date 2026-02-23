import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweny/app/common/theme/app_colors.dart';

/*
 *  Button Utama untuk Aplikasi!
 *  Variasi ada 4 , Size ada 3
 * 
 *  REUSABLE BUTTON COMPONENT
 */

enum SwenyButtonVariant { primary, secondary, outline, ghost }

enum SwenyButtonSize { small, medium, large }

// ── SwenyButton ─────────────────────────────────────────
class SwenyButton extends StatelessWidget {
  const SwenyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = SwenyButtonVariant.primary,
    this.size = SwenyButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
    this.suffixIcon,
  });

  final String label;
  final VoidCallback? onPressed;
  final SwenyButtonVariant variant;
  final SwenyButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;
  final IconData? suffixIcon;

  // ── Sizing ─────────────────────────────────────────
  double get _height => switch (size) {
    SwenyButtonSize.small => 40,
    SwenyButtonSize.medium => 52,
    SwenyButtonSize.large => 60,
  };

  double get _fontSize => switch (size) {
    SwenyButtonSize.small => 13,
    SwenyButtonSize.medium => 15,
    SwenyButtonSize.large => 16,
  };

  double get _iconSize => switch (size) {
    SwenyButtonSize.small => 16,
    SwenyButtonSize.medium => 18,
    SwenyButtonSize.large => 20,
  };

  // ── Styles per variant ─────────────────────────────
  BoxDecoration _decoration(bool isPressed) {
    return switch (variant) {
      SwenyButtonVariant.primary => BoxDecoration(
        gradient: isPressed
            ? const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
              )
            : AppColors.gradientPrimary,
        borderRadius: BorderRadius.circular(14),
        boxShadow: isPressed
            ? []
            : [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
      ),
      SwenyButtonVariant.secondary => BoxDecoration(
        color: AppColors.bgElevated,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      SwenyButtonVariant.outline => BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isPressed
              ? AppColors.primary
              : AppColors.primaryLight.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      SwenyButtonVariant.ghost => BoxDecoration(
        color: isPressed
            ? AppColors.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
    };
  }

  Color get _textColor => switch (variant) {
    SwenyButtonVariant.primary => Colors.white,
    SwenyButtonVariant.secondary => AppColors.textPrimary,
    SwenyButtonVariant.outline => AppColors.primaryLight,
    SwenyButtonVariant.ghost => AppColors.primaryLight,
  };

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    return AnimatedOpacity(
      opacity: isDisabled ? 0.5 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: _PressableButton(
        onTap: isDisabled ? null : onPressed,
        decoration: _decoration(false),
        height: _height,
        isFullWidth: isFullWidth,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        width: _iconSize,
        height: _iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_textColor),
        ),
      );
    }

    return Row(
      mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, color: _textColor, size: _iconSize),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: GoogleFonts.dmSans(
            fontSize: _fontSize,
            fontWeight: FontWeight.w600,
            color: _textColor,
            letterSpacing: 0.3,
          ),
        ),
        if (suffixIcon != null) ...[
          const SizedBox(width: 8),
          Icon(suffixIcon, color: _textColor, size: _iconSize),
        ],
      ],
    );
  }
}

// Press animation wrapper
class _PressableButton extends StatefulWidget {
  const _PressableButton({
    required this.child,
    required this.decoration,
    required this.height,
    required this.isFullWidth,
    this.onTap,
  });

  final Widget child;
  final BoxDecoration decoration;
  final double height;
  final bool isFullWidth;
  final VoidCallback? onTap;

  @override
  State<_PressableButton> createState() => _PressableButtonState();
}

class _PressableButtonState extends State<_PressableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.04,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.96).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, child) =>
            Transform.scale(scale: _scaleAnim.value, child: child),
        child: Container(
          height: widget.height,
          width: widget.isFullWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: widget.decoration,
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
