import 'dart:math';

import 'package:agro_life/models/bar_graph_model.dart';
import 'package:agro_life/models/graph_model.dart';
import 'package:flutter/material.dart';

class BarGraphData {
  static List<GraphModel> _generateRandomValues(int iterations) {
    final random = Random();
    return List.generate(iterations, (index) {
      // Values from [0 - 10]
      final x = random.nextDouble() * 11;
      final y = random.nextDouble() * 11;
      return GraphModel(x: x, y: y);
    });
  }

  final data = [
    BarGraphModel(
      label: 'Activity Level',
      color: Color(0xFFFEB95A),
      graph: _generateRandomValues(6)
    ),
    BarGraphModel(
      label: 'Nutriction',
      color: Color(0xFFF2C8ED),
      graph: _generateRandomValues(6)
    ),
    BarGraphModel(
      label: 'Hidration Level',
      color: Color(0xFF20AEF3),
      graph: _generateRandomValues(6)
    ),
  ];

  final label = ['M', 'T', 'W', 'T', 'F', 'S'];
}
