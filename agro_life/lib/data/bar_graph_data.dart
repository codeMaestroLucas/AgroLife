import 'dart:math';

import 'package:agro_life/models/bar_graph_model.dart';
import 'package:agro_life/models/graph_model.dart';
import 'package:agro_life/my_constraints.dart';

class BarGraphData {
  static List<GraphModel> _generateRandomValues(int iterations) {
    final random = Random();
    return List.generate(iterations, (index) {
      // Values from [0 - 10]
      final y = random.nextDouble() * 11;
      return GraphModel(x: index.toDouble(), y: y);
    });
  }

  final data = [
    BarGraphModel(
      label: '',
      color: colorYellow,
      graph: _generateRandomValues(5), // Generate exactly 5 values
    ),
    BarGraphModel(
      label: '',
      color: colorBlue,
      graph: _generateRandomValues(5), // Generate exactly 5 values
    ),
  ];
}
