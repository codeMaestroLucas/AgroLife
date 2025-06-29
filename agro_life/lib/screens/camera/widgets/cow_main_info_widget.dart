import 'package:agro_life/models/cow_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/widgets/field_label_widget.dart';
import 'package:flutter/material.dart';

class CowMainInfoWidget extends StatelessWidget {
  final CowModel cow;
  const CowMainInfoWidget({super.key, required this.cow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Sex Text
            const SizedBox(width: 0),
            FieldLabelWidget(title: 'Sexo', value: cow.gender),
            const SizedBox(width: 0),

            const SizedBox(width: 80),

            // Weigth Text + Status
            const SizedBox(width: 0),
            Column(
              children: [
                FieldLabelWidget(
                  title: 'Peso',
                  value: '${cow.currentWeight.toStringAsFixed(0)} kg',
                ),

                const SizedBox(height: 12),
                // Status
                _createStatus(cow.isDeceased),
              ],
            ),
            const SizedBox(width: 0),
          ],
        ),

        const SizedBox(height: 20),
        Text(cow.type, style: txtHeading3),
        Text(
          cow.id,
          style: txtLabels.copyWith(
            color: const Color(0xFF898989),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _createStatus(bool isDeceased) {
    String txtToDisplay = isDeceased ? 'Inativo' : 'Ativo';
    Color bgColor = isDeceased ? const Color(0xFFA13434) : Colors.green;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor,
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 5,
                  spreadRadius: 0.6,
                  offset: Offset(1.5, 1),
                ),
              ],
            ),
            width: 6,
            height: 6,
          ),

          const SizedBox(width: 4),

          Text(
            txtToDisplay,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              fontFamily: 'FunnelDisplay',
            ),
          ),
        ],
      ),
    );
  }
}
