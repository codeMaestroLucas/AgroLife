import 'package:agro_life/data/line_chart_data.dart';
import 'package:agro_life/themes/app_colors.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    final data = MyLineChartData();

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Steps Overview",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 16 / 6,
            child: LineChart(
              LineChartData(
                clipData:
                    FlClipData.all(), //* to make the data crop inside the graph
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
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    color: AppColors.selection,
                    barWidth: 2.5,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.selection.withValues(alpha: 0.5),
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
      ),
    );
  }
}
