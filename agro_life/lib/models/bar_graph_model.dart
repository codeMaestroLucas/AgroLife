import 'package:agro_life/models/graph_model.dart';
import 'package:flutter/material.dart';

class BarGraphModel {
  final String label;
  final Color color;
  final List<GraphModel> graph;
  List<String> bottomLabels = ['Jan', 'Apr', 'Jul', 'Oct', 'Dec'];

  BarGraphModel({
    required this.label,
    required this.color,
    required this.graph,
  });
}
