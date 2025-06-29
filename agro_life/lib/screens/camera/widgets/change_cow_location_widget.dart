import 'package:agro_life/models/cow_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/widgets/scaffold_msg_widget.dart';
import 'package:flutter/material.dart';

class ChangeCowLocationWidget extends StatefulWidget {
  final CowModel cow;
  const ChangeCowLocationWidget({super.key, required this.cow});

  @override
  State<ChangeCowLocationWidget> createState() =>
      _ChangeCowLocationWidgetState();
}

class _ChangeCowLocationWidgetState extends State<ChangeCowLocationWidget> {
  late int _currentSelectedLocation;

  final List<int> _lotOptions = [1, 2, 3];

  @override
  void initState() {
    super.initState();
    _currentSelectedLocation = widget.cow.currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: colorContent,
      title: Text('Movimentação', style: txtHeading2),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('Lote Atual', style: txtSubTitle),

              DropdownButton<int>(
                value: _currentSelectedLocation,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                iconSize: 32,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),

                underline: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: colorPrimary,
                  ),
                ),

                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _currentSelectedLocation = newValue;
                    });
                  }
                },
                items:
                    _lotOptions.map<DropdownMenuItem<int>>((int lot) {
                      return DropdownMenuItem<int>(
                        value: lot,
                        child: Text(lot.toString()),
                      );
                    }).toList(),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
      actions: <Widget>[
        // Close Pop btn
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fechar', style: TextStyle(color: Colors.blue)),
        ),

        // Save opt btn
        TextButton(
          onPressed: () {
            final selectedLot = _currentSelectedLocation;

            if (widget.cow.isDeceased) {
              // Show a success message
              showAppSnackBar(context, 'Movimentação Negada!');
            } else if (!widget.cow.isDeceased) {
              // Show a success message
              showAppSnackBar(context, 'Localização atualizada!');
            }
            // Pop the dialog, returning the modified cow object
            Navigator.of(context).pop(selectedLot);
          },

          child: const Text('Salvar', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
