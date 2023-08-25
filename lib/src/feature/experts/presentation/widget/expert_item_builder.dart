import 'package:flutter/material.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../../../../common/images.dart';

class ExpertItemBuilder extends StatelessWidget {
  final ExpertModel? _model;

  const ExpertItemBuilder(this._model, {Key? key}) : super(key: key);

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
                  image: "http://192.168.1.12:8080${_model?.avatarUrl ?? ""}",
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
          ),
          child: Text(
            _model?.nameEn ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Text(
            _model?.bioEn ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
