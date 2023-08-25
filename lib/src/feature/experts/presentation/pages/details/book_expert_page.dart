import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unknown/src/feature/experts/presentation/widget/slots_builder.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../widget/available_times_builder.dart';

@RoutePage()
class BookExpertPage extends StatefulWidget {
  const BookExpertPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookExpertState();
}

class _BookExpertState extends State<BookExpertPage> {
  List<String> testList = [];

  @override
  void initState() {
    super.initState();
    testList = [
      "Today",
      "Friday 8/11",
      "Tuesday 8/15",
      "Wednesday 8/16",
      "Friday 8/18",
      "Tuesday 8/22",
      "Wednesday 8/23",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: "Nate Berkus",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(
              start: 15,
              top: 10,
            ),
            child: const Text(
              'Book a video call',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: const Text(
              'Select one of the available time slots below:',
            ),
            margin: const EdgeInsetsDirectional.only(
              start: 15,
              top: 10,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(
                top: 10,
                end: 15,
                start: 15,
              ),
              child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return SlotsBuilder();
                },
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsetsDirectional.only(
                end: 15,
                start: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: testList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AvailableTimesBuilder(testList[index]);
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
