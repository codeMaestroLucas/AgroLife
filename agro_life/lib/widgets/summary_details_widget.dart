import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class SummaryDetailsWidget extends StatelessWidget {
  const SummaryDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: const Color(0xFF2F353E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          _buildDetails('Cal', '305'),
          _buildDetails('Steps', '10983'),
          _buildDetails('Distance', '7Km'),
          _buildDetails('Sleep', '7h'),
        ],
      ),
    );
  }

  Widget _buildDetails(String key, String value) {
    return Column(
      children: [
        Text(key, style: TextStyle(fontSize: 11, color: Colors.grey)),

        SizedBox(height: 2),
        Text(value, style: TextStyle(fontSize: 14)),
        ],
    );
  }
}
