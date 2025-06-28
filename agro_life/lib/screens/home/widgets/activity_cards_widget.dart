import 'package:agro_life/data/heath_details.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class ActivityCardsWidget extends StatelessWidget {
  const ActivityCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final heathDetails = HeathDetails();
    bool isMobile = Responsive.isMobile(context);

    return GridView.builder(
      itemCount: heathDetails.heathData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 4,
        crossAxisSpacing: isMobile ? 8 : 16,
        mainAxisSpacing: 8,
      ),

      itemBuilder:
          (context, index) => CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
          
              children: [
                Image.asset(
                  heathDetails.heathData[index].icon,
                  width: 30,
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 4),

                  child: Text(
                    heathDetails.heathData[index].value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                Text(
                  heathDetails.heathData[index].title,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
