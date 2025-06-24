import 'package:agro_life/my_constraints.dart';
import 'package:fl_chart/fl_chart.dart';

class MyPieChartData {
  final pieChartSectionDatas = [
    PieChartSectionData(
      color: colorPrimary,
      value: 24,
      showTitle: false,
      radius: 24,
    ),
    PieChartSectionData(
      color: colorYellow,
      value: 10,
      showTitle: false,
      radius: 12,
    ),
    PieChartSectionData(
      color: colorRed,
      value: 32,
      showTitle: false,
      radius: 4,
    ),
    PieChartSectionData(
      color: colorPrimary.withValues(alpha: 0.1),
      value: 25,
      showTitle: false,
      radius: 12,
    ),
  ];
}
