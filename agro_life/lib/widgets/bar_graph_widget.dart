import 'package:agro_life/models/bar_graph_model.dart';
import 'package:agro_life/models/graph_model.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphWidget extends StatelessWidget {
  final BarGraphModel chartData;

  const BarGraphWidget({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            chartData.label,
            style: TextStyle(
              fontSize: Responsive.isMobile(context) ? 12 : 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),

        Expanded(
          child: BarChart(
            BarChartData(
              backgroundColor: Colors.transparent,
              barTouchData: BarTouchData(enabled: true),
              barGroups: _chartGroups(
                points: chartData.graph,
                color: chartData.color,
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final label = chartData.bottomLabels[value.toInt()];
                      // if (label == null) return const SizedBox();
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? 8 : 10,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                    reservedSize: 24,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              maxY: 11,
              minY: 0,
              groupsSpace: 12,
              alignment: BarChartAlignment.spaceBetween,
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _chartGroups({
    required List<GraphModel> points,
    required Color color,
  }) {
    return points.map((point) {
      return BarChartGroupData(
        x: point.x.toInt(),
        barRods: [
          BarChartRodData(
            toY: point.y,
            width: 14,
            color: color.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
          ),
        ],
      );
    }).toList();
  }
}
