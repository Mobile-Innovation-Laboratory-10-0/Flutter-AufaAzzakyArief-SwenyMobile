import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweny/app/common/theme/app_colors.dart';
import 'package:sweny/app/routes/app_pages.dart';

class DayData {
  const DayData({
    required this.day,
    required this.hours,
    required this.score,
  });

  final String day;
  final double hours;
  final int score; // burnout score 0–100
}

class InsightsController extends GetxController {
  var selectedPeriod = 'Minggu Ini'.obs;

  final periods = ['Minggu Ini', 'Bulan Ini', '3 Bulan'];

  // Mock weekly burnout + coding hours data
  final weeklyData = const [
    DayData(day: 'Sen', hours: 7.5, score: 42),
    DayData(day: 'Sel', hours: 8.0, score: 51),
    DayData(day: 'Rab', hours: 6.0, score: 35),
    DayData(day: 'Kam', hours: 9.0, score: 68),
    DayData(day: 'Jum', hours: 5.5, score: 29),
    DayData(day: 'Sab', hours: 3.0, score: 18),
    DayData(day: 'Min', hours: 0.5, score: 10),
  ];

  double get avgCodingHours =>
      weeklyData.fold(0.0, (s, d) => s + d.hours) / weeklyData.length;

  int get avgBurnoutScore =>
      (weeklyData.fold(0, (s, d) => s + d.score) / weeklyData.length).round();

  String get peakDay {
    DayData peak = weeklyData.first;
    for (final d in weeklyData) {
      if (d.score > peak.score) peak = d;
    }
    return peak.day;
  }

  Color barColor(int score) {
    if (score < 30) return AppColors.success;
    if (score < 50) return AppColors.primary;
    if (score < 70) return AppColors.warning;
    return AppColors.error;
  }

  void changePeriod(String period) => selectedPeriod.value = period;

  void goToSubscription() => Get.toNamed(Routes.SUBSCRIPTION);
}
