import 'package:agro_life/my_constraints.dart';
import 'package:flutter/material.dart';

class FieldLabelWidget extends StatelessWidget {
  final String value;
  final String title;
  final bool bottomBorder;
  final bool invertTextOrder;

  const FieldLabelWidget({
    super.key,
    required this.value,
    required this.title,
    this.bottomBorder = true,
    this.invertTextOrder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        //* The spread operator and the List is used to avoid the rendering the same object twice
        if (invertTextOrder) ...[
          Text(value, style: txtSubTitle),
          Text(title, style: txtLabels.copyWith(color: const Color(0xFF898989))),
        ] else ...[
          Text(title, style: txtLabels.copyWith(color: const Color(0xFF898989))),
          Text(value, style: txtSubTitle),
        ],

        if (bottomBorder)
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 52,
            height: 1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}