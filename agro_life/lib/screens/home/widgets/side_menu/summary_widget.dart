import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/home/widgets/side_menu/summary_details_widget.dart';
import 'package:agro_life/screens/home/widgets/side_menu/week_objectives_widget.dart';
import 'package:agro_life/widgets/graphs/pie_chart.widget.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: colorBg),

      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              MyPieChart(),

              const Text('Resumo Mensal', style: txtHeading3),
              SizedBox(height: 8),
              MonthSummary(),

              SizedBox(height: spaceBetweenElements),
              WeekObjectives(),
            ],
          ),
        ),
      ),
    );
  }
}
