import 'package:agro_life/models/cow_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/screens/camera/widgets/bottom_actions_widget.dart';
import 'package:agro_life/screens/camera/widgets/cow_additional_info_widget.dart';
import 'package:agro_life/screens/camera/widgets/cow_deseases_widget.dart';
import 'package:agro_life/screens/camera/widgets/cow_main_info_widget.dart';
import 'package:flutter/material.dart';

class QRCodeDetailsScreen extends StatefulWidget {
  const QRCodeDetailsScreen({super.key});

  @override
  State<QRCodeDetailsScreen> createState() => _QRCodeDetailsScreenState();
}

class _QRCodeDetailsScreenState extends State<QRCodeDetailsScreen> {
  CowModel cow = CowData().cowData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do animal', style: txtHeading2),
      ),

      body: Stack(
        children: [
          // Background image covering the top part
          Image.asset(
            'assets/images/green_field.jpg',
            fit: BoxFit.fitWidth,
          ),

          // Main content column
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 200), // To show the greenField img

                    Container(
                      decoration: const BoxDecoration(
                        color: colorBg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),

                      child: Builder(
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              const SizedBox(height: 12),
                              CowMainInfoWidget(cow: cow),

                              const SizedBox(height: spaceBetweenElements),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),

                                child: CowAdditionalInfoWidget(cow: cow),
                              ),

                              const SizedBox(height: spaceBetweenElements),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),

                                child: CowDeseasesWidget(cow: cow),
                              ),

                              const SizedBox(height: spaceBetweenElements),
                              BottomActionsWidget(
                                cow: cow,
                                onCowUpdated: () {
                                  setState(
                                    () {},
                                  ); // This will refresh the screen and update the UI
                                },
                              ),

                              // Add some bottom padding
                              const SizedBox(height: spaceBetweenElements * 2),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),

                // The cow image
                Positioned(
                  top: 100,
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(cow.image),
                    maxRadius: 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
