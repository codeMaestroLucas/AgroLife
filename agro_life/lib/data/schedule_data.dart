import 'package:agro_life/models/schedule_model.dart';

class ScheduleData {
  final schedules = [
    ScheduleModel(title: 'Vacinação (Febre Aftosa)', date: 'Hoje, 9h - 10h'),
    ScheduleModel(title: 'Vermifugação (Bezerros)', date: 'Amanhã, 14h - 15h'),
    ScheduleModel(
      title: 'Inseminação Artificial',
      date: 'Quarta-feira, 8h - 12h',
    ),
    ScheduleModel(title: 'Pesagem do Gado', date: 'Próxima Segunda, 7h - 11h'),
    ScheduleModel(title: 'Manejo de Pastagem', date: 'Quinta-feira, 10h - 12h'),
  ];
}
