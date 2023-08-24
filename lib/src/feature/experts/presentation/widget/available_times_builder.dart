import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'time_builder.dart';


class AvailableTimesBuilder extends StatelessWidget {
  String title;

  AvailableTimesBuilder(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       Container(
         margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
         child: Text(
           title,
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
         itemCount: 12,
         itemBuilder: (context, index) {
           return const TimeBuilder();
         },
       ),
     ],
   );
  }


}
