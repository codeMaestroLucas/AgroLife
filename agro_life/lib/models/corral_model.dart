class CorralModel {
  final String image;
  final String name;
  final double minWeight;
  final double maxWeight;
  final double space;
  final String corralType;
  final int quantityCows;
  final int averageAge; // in months
  final double temperatureSensor; // in °C
  final double humidity; // in %

  CorralModel({
    required this.image,
    required this.name,
    required this.minWeight,
    required this.maxWeight,
    required this.space,
    required this.corralType,
    required this.quantityCows,
    required this.averageAge,
    required this.temperatureSensor,
    required this.humidity,
  });

  String get troughArea {
    if (quantityCows == 0) return 'N/A';
    final value = space / quantityCows;
    return '${value.toStringAsFixed(2)} m/cabeça';
  }
}

class CorralData {
  List<CorralModel> data = [
    CorralModel(
      image: 'assets/images/corral_1.jpg',
      name: 'Curral Principal',
      minWeight: 500.0,
      maxWeight: 750.0,
      space: 3500.0,
      corralType: 'Confinamento',
      quantityCows: 450,
      averageAge: 24,
      temperatureSensor: 28.5,
      humidity: 65.0,
    ),
    CorralModel(
      image: 'assets/images/corral_4.jpg',
      name: 'Curral Maternidade',
      minWeight: 80.0,
      maxWeight: 200.0,
      space: 1000.0,
      corralType: 'Piquete',
      quantityCows: 200,
      averageAge: 3,
      temperatureSensor: 30.0,
      humidity: 70.5,
    ),
    CorralModel(
      image: 'assets/images/corral_2.jpg',
      name: 'Curral de Recriação',
      minWeight: 200.0,
      maxWeight: 450.0,
      space: 750.0,
      corralType: 'Semi-intensivo',
      quantityCows: 150,
      averageAge: 12,
      temperatureSensor: 29.0,
      humidity: 68.0,
    ),
  ];
}
