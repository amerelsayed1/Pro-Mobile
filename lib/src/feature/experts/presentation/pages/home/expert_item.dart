import 'package:flutter/material.dart';
import 'package:unknown/src/feature/experts/data/models/expert_response.dart';

import '../../../../../../common/images.dart';
import '../../../../../../common/util/constants.dart';
import '../../../data/models/expert_model.dart';

class ExpertItem extends StatelessWidget {
  final ExpertModel expert;

  ExpertItem({required this.expert});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
            placeholder: Images.ic_place_holder,
            image: "${Constants.baseApiUrl}${expert.avatarUrl ?? ""}",
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                Images.ic_place_holder,
                fit: BoxFit.fitWidth,
              );
            },
            height: 120.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expert.titleEn ?? "",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$${expert.startingPrice?.amount?.toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  expert.bioEn ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
