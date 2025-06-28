import 'package:agro_life/data/line_chart_data.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    final data = MyLineChartData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        AspectRatio(
          aspectRatio: 16 / 6,
          child: LineChart(
            LineChartData(
              backgroundColor:
                  Colors.transparent, // Ensure transparent background
              clipData: FlClipData.all(),
              lineTouchData: LineTouchData(handleBuiltInTouches: true),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: isMobile ? 3 : 1,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return data.bottomTitle[value.toInt()] != null
                          ? SideTitleWidget(
                            meta: meta,
                            child: Text(
                              data.bottomTitle[value.toInt()].toString(),
                              style: TextStyle(
                                fontSize: isMobile ? 8 : 12,
                                color: Colors.grey[400],
                              ),
                            ),
                          )
                          : const SizedBox();
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return data.leftTitle[value.toInt()] != null
                          ? Container(
                            margin: EdgeInsets.only(right: 4),
                            child: Text(
                              data.leftTitle[value.toInt()].toString(),
                              style: TextStyle(
                                fontSize: isMobile ? 10 : 12,
                                color: Colors.grey[400],
                              ),
                            ),
                          )
                          : const SizedBox();
                    },
                    showTitles: true,
                    interval: 20,
                    reservedSize: 40,
                  ),
                ),
              ),
              borderData: FlBorderData(show: false), // No chart border
              lineBarsData: [
                LineChartBarData(
                  color: colorSelection,
                  barWidth: 2.5,
                  belowBarData: BarAreaData(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colorSelection.withAlpha(
                          50,
                        ), // Use withAlpha instead of withValues
                        Colors.transparent,
                      ],
                    ),
                    show: true,
                  ),
                  dotData: FlDotData(show: false),
                  spots: data.spots,
                ),
              ],
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 100,
            ),
          ),
        ),
      ],
    );
  }
}
