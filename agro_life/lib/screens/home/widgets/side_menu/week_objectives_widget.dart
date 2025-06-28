import 'package:agro_life/data/schedule_data.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class WeekObjectives extends StatelessWidget {
  const WeekObjectives({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ScheduleData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,

      children: [
        const Text(
          'Objetivos Semanais',
          style: txtHeading3,
        ),

        for (var index = 0; index < data.schedules.length; index++)
          CustomCard(
            color: const Color(0xFF232323),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text(
                      data.schedules[index].title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 2),
                    Text(
                      data.schedules[index].date,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const Icon(Icons.more),
              ],
            ),
          ),

        const SizedBox(height: 32),
      ],
    );
  }
}
