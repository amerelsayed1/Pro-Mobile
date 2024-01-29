import 'package:flutter/material.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../../../../common/images.dart';

class ExpertItemBuilder extends StatelessWidget {
  final ExpertModel? expert;

  const ExpertItemBuilder(this.expert, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 160,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.ic_place_holder,
                  image: expert?.avatarUrl ?? "",
                  //image: "${Constants.baseApiUrl}${expert?.avatarUrl ?? ""}",
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      Images.ic_place_holder,
                      fit: BoxFit.fitWidth,
                    );
                  },
                  fit: BoxFit.fill,
                  height: 170,
                  width: double.infinity,
                ),
              )),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(
            bottom: 5,
            start: 5
          ),
          child: Text(
            expert?.nameEn ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(
              bottom: 5,
              start: 5
          ),
          child: Text(
            expert?.titleEn ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),

      ],
    );
  }
}
