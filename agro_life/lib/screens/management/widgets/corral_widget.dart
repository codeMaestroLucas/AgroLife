import 'package:agro_life/models/corral_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/widgets/field_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CorralWidget extends StatelessWidget {
  final CorralModel corral;
  const CorralWidget({super.key, required this.corral});

  @override
  Widget build(BuildContext context) {
    String corralName = corral.name.replaceAll('Curral', '').trim();

    return Container(
      color: const Color(0xFF012D3F),

      child: Column(
        children: [
          // Image & Title
          Stack(
            children: [
              Image.asset(corral.image, fit: BoxFit.fitWidth),
              Container(
                padding: const EdgeInsets.only(
                  left: 4,
                  right: 4,
                  top: 4,
                  bottom: 12,
                ),
                color: const Color(0xA0000000),

                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: corralName,
                        style: txtHeading2.copyWith(color: colorWhite),
                      ),

                      TextSpan(
                        text: '\n${corral.corralType}',
                        style: txtSubTitle.copyWith(
                          color: colorWhite,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Main Info
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    // Left column
                    Column(
                      spacing: 20,

                      children: [
                        FieldLabelWidget(
                          title: 'Peso Min',
                          value: '${corral.minWeight.toStringAsFixed(0)} kg',
                          bottomBorder: false,
                        ),

                        FieldLabelWidget(
                          title: 'Área Total',
                          value: '${corral.space.toStringAsFixed(1)}m²',
                          bottomBorder: false,
                        ),

                        FieldLabelWidget(
                          title: 'Total de Animais',
                          value: corral.quantityCows.toString(),
                          bottomBorder: false,
                        ),

                        FieldLabelWidget(
                          title: 'Temperatura',
                          value:
                              '${corral.temperatureSensor.toStringAsFixed(1)}ºC',
                          bottomBorder: false,
                        ),
                      ],
                    ),

                    const SizedBox(width: 0),

                    // Right column
                    Column(
                      spacing: 20,

                      children: [
                        FieldLabelWidget(
                          title: 'Peso Max',
                          value: '${corral.maxWeight.toStringAsFixed(0)} kg',
                          bottomBorder: false,
                        ),

                        FieldLabelWidget(
                          title: 'Área de Cocho',
                          value: corral.troughArea,
                          bottomBorder: false,
                        ),

                        FieldLabelWidget(
                          title: 'Média de Idade',
                          value: corral.averageAge.toString(),
                          bottomBorder: false,
                        ),

                        FieldLabelWidget(
                          title: 'Umidade',
                          value: "${corral.humidity.toStringAsFixed(1)}%",
                          bottomBorder: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
