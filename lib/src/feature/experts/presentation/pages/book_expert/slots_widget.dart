import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../data/models/available_list_model.dart';
import '../../widget/time_builder.dart';

class SlotsWidget extends StatefulWidget {

  AvailableListModel? slot;

  SlotsWidget({super.key, required this.slot});

  @override
  State<SlotsWidget> createState() => _SlotsWidgetState();
}

class _SlotsWidgetState extends State<SlotsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
          child: Text(
            widget.slot?.date??"",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ),

        AlignedGridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 8,
          itemCount: widget.slot?.hoursList.length,
          itemBuilder: (context, index) {



            return GestureDetector(
              onTap: () {

              },
              child: Text(widget.slot?.hoursList[index].hour??""),
            );
          },
        ),
      ],
    );
  }
}
