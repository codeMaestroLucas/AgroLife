class CowModel {
  final String image;
  final String id;
  final String type;
  final String gender;
  final String cowSupplier;
  final double currentWeight;
  final double desirableWeight;
  final double initialWeight;
  final DateTime arrivalDate;
  final DateTime birthDate;
  final List<Map<String, String>> diseases;
  int currentLocation; // Lote
  bool isDeceased;

  CowModel({
    required this.image,
    required this.id,
    required this.type,
    required this.gender,
    required this.cowSupplier,
    required this.currentWeight,
    required this.desirableWeight,
    required this.initialWeight,
    required this.arrivalDate,
    required this.birthDate,
    required this.currentLocation,
    required this.isDeceased,
    this.diseases = const [
      {
        'name': 'Mastite',
        'dt_descobrimento': 'Desconhecida',
        'symptoms':
            'Úbere inchado, quente e dolorido; leite com grumos, coágulos ou sangue; febre e perda de apetite em casos graves.',
        'treat_desc':
            'Antibióticos intramamários e/ou sistêmicos. Anti-inflamatórios para reduzir inchaço. Ordenha frequente para esvaziar o úbere.',
      },
      {
        "name": "Febre Aftosa",
        "dt_descobrimento": "05/12/24",
        "symptoms":
            "Bolhas (aftas) na boca, língua, narinas e cascos; salivação excessiva; claudicação; febre; perda de peso e queda na produção de leite.",
        "treat_desc":
            "Não há tratamento antiviral específico para a Febre Aftosa. O manejo consiste em cuidados como isolamento e adminsitração de antinflamatórios.",
      },
    ],
  });
}

class CowData {
  CowModel cowData = CowModel(
    image: 'assets/images/cow.jpg',
    id: '105520413598455',
    type: 'Gado de origem leiteira',
    gender: 'F',
    cowSupplier: 'Alex',
    currentWeight: 325,
    desirableWeight: 450,
    initialWeight: 290,
    arrivalDate: DateTime(2024, 6, 26),
    birthDate: DateTime(2025, 12, 11),
    currentLocation: 1,
    isDeceased: false,
  );
}
