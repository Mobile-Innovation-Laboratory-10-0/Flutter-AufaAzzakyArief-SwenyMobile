import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

/*
 * Color utama Untuk Aplikasi!
 * Primary : #2D7DD2
 */

  // ── Primary Brand ──────────────────────────────────
  static const primary = Color(0xFF2D7DD2);
  static const primaryLight = Color(0xFF4DA3FF);
  static const primaryDark = Color(0xFF1A4A8A);

  // ── Background ─────────────────────────────────────
  static const bgBase = Color(0xFF020B18); // halaman utama
  static const bgCard = Color(0xFF0D1F33); // card / container
  static const bgElevated = Color(0xFF1A2E45); // input field, elevated surface

  // ── Text ───────────────────────────────────────────
  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFFB0C4D8);
  static const textHint = Color(0xFF4A6580);

  // ── Border ─────────────────────────────────────────
  static const border = Color(0xFF1E3A55);
  static const borderFocus = Color(0xFF2D7DD2);

  // ── Status ─────────────────────────────────────────
  static const success = Color(0xFF3DDC84);
  static const warning = Color(0xFFFFB547);
  static const error = Color(0xFFFF5C5C);

  // ── Gradient shortcuts ─────────────────────────────
  static const gradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primary],
  );

  static const gradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A3A5C), bgBase],
  );

  static const gradientCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A2E45), bgCard],
  );
}
