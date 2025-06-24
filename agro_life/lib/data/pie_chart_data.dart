import 'package:agro_life/themes/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChartData {
  final pieChartSectionDatas = [
    PieChartSectionData(
      color: AppColors.primary,
      value: 24,
      showTitle: false,
      radius: 24,
    ),
    PieChartSectionData(
      color: const Color(0Xffffcf26),
      value: 10,
      showTitle: false,
      radius: 12,
    ),
    PieChartSectionData(
      color: const Color(0xFFEE2727),
      value: 32,
      showTitle: false,
      radius: 4,
    ),
    PieChartSectionData(
      color: AppColors.primary.withValues(alpha: 0.1),
      value: 25,
      showTitle: false,
      radius: 12,
    ),
  ];
}
