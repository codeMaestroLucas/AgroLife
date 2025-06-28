import 'package:agro_life/data/med_data.dart';
import 'package:agro_life/models/med_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/management/widgets/med_widget.dart';
import 'package:flutter/material.dart';

class ManagementScreen extends StatelessWidget {
  final List<MedModel> medData = MedData().data;

  ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento', style: txtHeading2),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: paddingMainScreens,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Meds
              Text('Estoque', style: txtHeading3),
              const SizedBox(height: 8),
              ...medData
                  .map(
                    (med) => [MedWidget(med: med), const SizedBox(height: 12)],
                  )
                  .expand((item) => item),

              // Curral
              const SizedBox(height: sizeElementsSeparator),
              Text('Currais', style: txtHeading3),
            ],
          ),
        ),
      ),
    );
  }
}
