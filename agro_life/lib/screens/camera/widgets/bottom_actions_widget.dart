import 'package:agro_life/models/cow_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/camera/widgets/change_cow_location_widget.dart';
import 'package:agro_life/widgets/scaffold_msg_widget.dart';
import 'package:flutter/material.dart';

class BottomActionsWidget extends StatefulWidget {
  final CowModel cow;
  final VoidCallback onCowUpdated;

  const BottomActionsWidget({
    super.key,
    required this.cow,
    required this.onCowUpdated,
  });

  @override
  State<BottomActionsWidget> createState() => _BottomActionsWidgetState();
}

class _BottomActionsWidgetState extends State<BottomActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              // Show a success message
              showAppSnackBar(context, 'Morte Registrada');
              widget.cow.isDeceased = !widget.cow.isDeceased;
              widget.onCowUpdated(); // Notify parent to refresh
            });
          },

          child: Container(
            height: 64,
            width: 170,
            decoration: BoxDecoration(
              color: colorRed,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Center(child: Text('Registrar Morte', style: txtHeading3)),
          ),
        ),

        // Movimentation btn
        InkWell(
          onTap: () async {
            final int? newLocation = await showDialog<int>(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: const EdgeInsets.all(16),
                  child: ChangeCowLocationWidget(cow: widget.cow),
                );
              },
            );

            if (newLocation != null) {
              setState(() {
                widget.cow.currentLocation = newLocation;
              });
              widget.onCowUpdated(); // Notify parent to refresh
            }
          },

          child: Container(
            height: 64,
            width: 170,
            decoration: BoxDecoration(
              color: colorDarkBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Movimentação', style: txtHeading3)),
          ),
        ),
      ],
    );
  }
}
