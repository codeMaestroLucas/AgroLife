import 'package:agro_life/models/cow_model.dart';
import 'package:agro_life/screens/camera/widgets/field_label_widget.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CowAdditionalInfoWidget extends StatelessWidget {
  final CowModel cow;
  const CowAdditionalInfoWidget({super.key, required this.cow});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Informações Adicionais',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Column
          Column(
            children: [
              const SizedBox(height: 12),
              FieldLabelWidget(
                title: 'Fornecedor',
                value: cow.cowSupplier,
                bottomBorder: false,
                invertTextOrder: false,
              ),

              const SizedBox(height: 8),
              FieldLabelWidget(
                title: 'Peso de Entrada',
                value: '${cow.initialWeight.toStringAsFixed(0)} kg',
                bottomBorder: false,
                invertTextOrder: false,
              ),

              const SizedBox(height: 8),
              FieldLabelWidget(
                title: 'Data de Entrada',
                value: _formatDate(cow.arrivalDate),
                bottomBorder: false,
                invertTextOrder: false,
              ),
            ],
          ),

          // Right Column
          Column(
            children: [
              const SizedBox(height: 12),
              FieldLabelWidget(
                title: 'Lote',
                value: cow.currentLocation.toString(),
                bottomBorder: false,
              ),

              const SizedBox(height: 8),
              FieldLabelWidget(
                title: 'Peso Desejado',
                value: '${cow.desirableWeight.toStringAsFixed(0)} kg',
                bottomBorder: false,
                invertTextOrder: false,
              ),

              const SizedBox(height: 8),
              FieldLabelWidget(
                title: 'Data de Nascimento',
                value: _formatDate(cow.birthDate),
                bottomBorder: false,
                invertTextOrder: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
