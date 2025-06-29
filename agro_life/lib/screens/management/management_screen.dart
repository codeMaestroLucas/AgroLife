import 'dart:math';

import 'package:agro_life/data/med_data.dart';
import 'package:agro_life/models/corral_model.dart';
import 'package:agro_life/models/med_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/management/widgets/corral_widget.dart';
import 'package:agro_life/screens/management/widgets/med_widget.dart';
import 'package:agro_life/screens/management/widgets/slides_counter_widget.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:flutter/material.dart';

class ManagementScreen extends StatelessWidget {
  final List<CorralModel> data = CorralData().data;
  final Function(int) onChange;
  final int currentSlide;

  final List<MedModel> medData = MedData().data;

  ManagementScreen({
    super.key,
    required this.onChange,
    required this.currentSlide,
  });

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

              // Currais
              const SizedBox(height: sizeElementsSeparator),
              Text('Currais', style: txtHeading3),
              const SizedBox(height: 8),

              Stack(
                children: [
                  SizedBox(
                    height: _getCorralHeight(context),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),

                      child: PageView(
                        onPageChanged: onChange,
                        scrollDirection: Axis.horizontal,
                        allowImplicitScrolling: true,
                        physics: const ClampingScrollPhysics(),

                        children: List.generate(
                          data.length,
                          (index) => CorralWidget(corral: data[index]),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SlidesCounterWidget(currentSlide: currentSlide),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: sizeElementsSeparator),
            ],
          ),
        ),
      ),
    );
  }

  double _getCorralHeight(BuildContext context) {
    late double _height;
    if (Responsive.isMobile(context)) {
      _height = max(550, min(MediaQuery.of(context).size.width - 80, 700));
    } else if (Responsive.isTablet(context)) {
      _height = max(750, MediaQuery.of(context).size.width - 100);
    } else {
      _height = min(950, MediaQuery.of(context).size.width - 100);
    }

    return _height;
  }
}
