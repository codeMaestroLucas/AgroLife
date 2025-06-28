import 'package:agro_life/models/med_model.dart';
import 'package:agro_life/my_constraints.dart';
import 'package:agro_life/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class MedWidget extends StatelessWidget {
  final MedModel med;
  const MedWidget({super.key, required this.med});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              // Image or placeholder
              Container(
                width: 100,
                height: 100,

                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    med.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 16),
              // Text and info content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      med.title,
                      style: txtHeading3,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),

                    // Quantity badge
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Text(
                        med.quantityInStock.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Description
          const SizedBox(height: 8),
          Text(
            med.description,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 189, 189, 189),
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
