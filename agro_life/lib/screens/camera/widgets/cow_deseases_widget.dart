import 'package:agro_life/models/cow_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class CowDeseasesWidget extends StatelessWidget {
  final CowModel cow;
  const CowDeseasesWidget({super.key, required this.cow});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Histórico de Doenças',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 12),

          ...cow.diseases.map((disease) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // Expanded to ensure text doesn't overflow if it's long
                      child: Text(
                        disease['name'] ?? 'Nome Desconhecido',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),
                    Text(
                      disease['dt_descobrimento'] ?? 'Data Desconhecida',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                // Symptoms
                const SizedBox(height: 8),
                Text('Sintomas', style: txtSubTitle.copyWith(fontSize: 13)),
                Text(
                  '${disease['symptoms']}',
                  style: const TextStyle(fontSize: 13, color: colorLabel),
                ),

                // Treatment description
                const SizedBox(height: 8),
                Text('Tratamento', style: txtSubTitle.copyWith(fontSize: 13)),
                Text(
                  '${disease['treat_desc']}',
                  style: const TextStyle(fontSize: 13, color: colorLabel),
                ),

                const SizedBox(height: sizeElementsSeparator + 12),
              ],
            );
          }),
        ],
      ),
    );
  }
}
