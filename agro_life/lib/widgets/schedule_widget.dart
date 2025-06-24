import 'package:agro_life/data/schedule_data.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ScheduleData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          'Scheduled',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 12),

        for (var index = 0; index < data.schedules.length; index++)
          CustomCard(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

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
      ],
    );
  }
}
