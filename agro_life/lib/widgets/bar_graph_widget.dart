import 'package:agro_life/data/bar_graph_data.dart';
import 'package:agro_life/models/graph_model.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphWidget extends StatelessWidget {
  const BarGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final barGraphData = BarGraphData();

    return GridView.builder(
      itemCount: barGraphData.data.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 12,
        childAspectRatio: 5 / 4,
      ),

      itemBuilder: (context, index) {
        return CustomCard(
          padding: const EdgeInsets.all(4),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                
                child: Text(
                  barGraphData.data[index].label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: BarChart(
                  BarChartData(
                    barGroups: _chartGroups(
                      points: barGraphData.data[index].graph,
                      color: barGraphData.data[index].color,
                    ),
                    borderData: FlBorderData(border: const Border()),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final safeValue =
                                value.toInt() %
                                barGraphData.data[index].graph.length;

                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                barGraphData.label[safeValue],
                                style: TextStyle(
                                  fontSize:
                                      Responsive.isMobile(context) ? 8 : 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
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
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _chartGroups({
    required List<GraphModel> points,
    required Color color,
  }) {
    return points
        .map(
          (point) => BarChartGroupData(
            x: point.x.toInt(),
            barRods: [
              BarChartRodData(
                toY: point.y,
                width: 12,
                color: color.withValues(alpha: point.y.toInt() > 4 ? 1 : 0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
