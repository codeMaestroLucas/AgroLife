import 'package:agro_life/util/responsive.dart';
import 'package:agro_life/widgets/activity_cards_widget.dart';
import 'package:agro_life/widgets/bar_graph_widget.dart';
import 'package:agro_life/widgets/header_widget.dart';
import 'package:agro_life/widgets/line_chart_widget.dart';
import 'package:agro_life/widgets/summary_widget.dart';
import 'package:flutter/material.dart';

class DashBordWidget extends StatelessWidget {
  const DashBordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          children: [
            const SizedBox(height: 16),
            HeaderWidget(),

            const SizedBox(height: 16),
            ActivityCardsWidget(),

            const SizedBox(height: 16),
            LineChartWidget(),

            const SizedBox(height: 16),
            BarGraphWidget(),
            
            const SizedBox(height: 16),
            if (Responsive.isTablet(context)) const SummaryWidget(),
          ],
        ),
      ),
    );
  }
}
