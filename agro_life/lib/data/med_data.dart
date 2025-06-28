import 'package:agro_life/models/med_model.dart';

class MedData {
  final data = [
    MedModel(
      image: 'assets/images/med.png',
      title: 'Antibiótico Amplo Espectro',
      description: 'Tratamento de infecções bacterianas comuns em bovinos.',
      quantityInStock: '25 Und',
    ),
    MedModel(
      image: 'assets/images/med.png',
      title: 'Anti-inflamatório (Flunixin Meglumine)',
      description: 'Alívio da dor e inflamação pós-procedimentos ou lesões.',
      quantityInStock: '15 Und',
    ),
    MedModel(
      image: 'assets/images/feed.png',
      title: 'Suplemento Mineral Bovino',
      description:
          'Suplemento para garantir o balanço mineral na dieta do gado.',
      quantityInStock: '500 Kg',
    ),
  ];
}
