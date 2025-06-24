import 'package:agro_life/themes/app_colors.dart';
import 'package:agro_life/widgets/chart.widget.dart';
import 'package:agro_life/widgets/schedule_widget.dart';
import 'package:agro_life/widgets/summary_details_widget.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: AppColors.bg),

      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Chart(),

              Text(
                'Summary',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 16),
              SummaryDetailsWidget(),
              
              SizedBox(height: 40),
              ScheduleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
