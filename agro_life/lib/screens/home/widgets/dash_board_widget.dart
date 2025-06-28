import 'package:agro_life/data/bar_graph_data.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/home/widgets/header_widget.dart';
import 'package:agro_life/screens/home/widgets/side_menu/summary_widget.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:agro_life/widgets/graphs/bar_graph_widget.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:agro_life/widgets/graphs/line_chart_widget.dart';
import 'package:agro_life/widgets/graphs/pie_chart.widget.dart';
import 'package:flutter/material.dart';

class DashBordWidget extends StatelessWidget {
  final BarGraphData barGraphData = BarGraphData();

  DashBordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 16),
            HeaderWidget(),

            // Status dos Animais
            const SizedBox(height: 16),
            CustomCard(
              title: 'Status dos Animais',
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  MyPieChart(),

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _labelRow('em Tratamento', colorRed),
                      _labelRow('Tratados', colorYellow),
                      _labelRow('Saudáveis', colorPrimary),
                    ],
                  ),
                ],
              ),
            ),

            // Rentabilidade
            const SizedBox(height: 16),
            CustomCard(title: 'Rentabilidade', child: LineChartWidget()),

            // Taxa de Mortalidade (index 0)
            const SizedBox(height: 16),
            CustomCard(
              title: 'Taxa de Mortalidade',
              child: SizedBox(
                height: 200, // or whatever fits best
                child: BarGraphWidget(chartData: barGraphData.data[0]),
              ),
            ),

            // Taxa de Natalidade (index 1)
            const SizedBox(height: 16),
            CustomCard(
              title: 'Taxa de Natalidade',
              child: SizedBox(
                height: 200,
                child: BarGraphWidget(chartData: barGraphData.data[1]),
              ),
            ),

            // SummaryWidget
            const SizedBox(height: 16),
            if (Responsive.isTablet(context))
              CustomCard(title: 'Summary', child: const SummaryWidget()),
          ],
        ),
      ),
    );
  }


  Row _labelRow(String title, Color labelColor) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: labelColor,
          ),
        ),
        
        const SizedBox(width: 8),
        Text(title, style: txtLabels),
      ],
    );
  }
}
