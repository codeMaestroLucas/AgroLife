import 'package:agro_life/data/pie_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final pieChartData = MyPieChartData().pieChartSectionDatas;

    return SizedBox(
      height: 200,

      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: pieChartData,
            ),
          ),

          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  '70%',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),

                const Text('of 100%'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
