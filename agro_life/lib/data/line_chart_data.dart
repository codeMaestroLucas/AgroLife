import 'dart:math';

import 'package:fl_chart/fl_chart.dart';


class MyLineChartData {
  // Generate 100 random spots (x: 0-29, y: random 0-100)
  final spots = List.generate(100, (index) {
    final random = Random();
    return FlSpot(index.toDouble(), random.nextDouble() * 100);
  });

  // Y-axis labels (left titles)
  final Map<int, String> leftTitle = {
    0: '0',
    20: '2k',
    40: '4k',
    60: '6k',
    80: '8k',
    100: '10k',
  };

  // X-axis labels (bottom titles) - Months
  final Map<int, String> bottomTitle = {
    0: 'Jan',
    1: 'Feb',
    2: 'Mar',
    3: 'Apr',
    4: 'May',
    5: 'Jun',
    6: 'Jul',
    7: 'Aug',
    8: 'Sep',
    9: 'Oct',
    10: 'Nov',
    11: 'Dec',
  };
}
