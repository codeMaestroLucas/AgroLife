import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class MonthSummary extends StatelessWidget {
  const MonthSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: const Color(0xFF2F353E),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Expanded(child: _buildDetails('Tx. Mortalidade', '0.2%')),
          Expanded(child: _buildDetails('Tx. Natalidade', '8%')),
          Expanded(child: _buildDetails('Rentabilidade', 'R\$ 37.000')),
        ],
      ),
    );
  }

  Widget _buildDetails(String txt, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Text(
          txt,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),

        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 12, color: Colors.white),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}
