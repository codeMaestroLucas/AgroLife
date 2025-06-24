import 'package:agro_life/data/bar_graph_data.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:agro_life/widgets/bar_graph_widget.dart';
import 'package:agro_life/widgets/chart.widget.dart';
import 'package:agro_life/widgets/header_widget.dart';
import 'package:agro_life/widgets/line_chart_widget.dart';
import 'package:agro_life/widgets/summary_widget.dart';
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
            _buildCard(
              title: 'Status dos Animais',
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  MyPieChart(),
                  const SizedBox(height: 8),
                  _generateLabelsPieChart(),
                ],
              ),
            ),

            // Rentabilidade
            const SizedBox(height: 16),
            _buildCard(title: 'Rentabilidade', child: LineChartWidget()),

            // Taxa de Mortalidade (index 0)
            const SizedBox(height: 16),
            _buildCard(
              title: 'Taxa de Mortalidade',
              child: SizedBox(
                height: 200, // or whatever fits best
                child: BarGraphWidget(chartData: barGraphData.data[0]),
              ),
            ),

            // Taxa de Natalidade (index 1)
            const SizedBox(height: 16),
            _buildCard(
              title: 'Taxa de Natalidade',
              child: SizedBox(
                height: 200,
                child: BarGraphWidget(chartData: barGraphData.data[1]),
              ),
            ),

            // SummaryWidget
            const SizedBox(height: 16),
            if (Responsive.isTablet(context))
              _buildCard(title: 'Summary', child: const SummaryWidget()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: colorCardBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title, style: txtSubTitle), child],
      ),
    );
  }

  Widget _generateLabelsPieChart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colorRed,
              ),
            ),
            const SizedBox(width: 8),
            Text('em Tratamento', style: txtLabels),
          ],
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colorYellow,
              ),
            ),
            const SizedBox(width: 8),
            Text('Tratados', style: txtLabels),
          ],
        ),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colorPrimary,
              ),
            ),
            const SizedBox(width: 8),
            Text('Saudáveis', style: txtLabels),
          ],
        ),
      ],
    );
  }
}
