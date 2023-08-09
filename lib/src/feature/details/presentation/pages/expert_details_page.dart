import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_appbar.dart';

class ExpertDetailsPage extends ConsumerStatefulWidget {
  const ExpertDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpertDetailsState();
}

class _ExpertDetailsState extends ConsumerState<ExpertDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: "Nate Berkus",
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 10,
          end: 10,
          top: 5,
          bottom: 5,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 320,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              "https://media.intro.co/avatars/434693o27ZCXhE.jpg",
                              fit: BoxFit.fill,
                              height: 170,
                              width: double.infinity,
                            ),
                          )),
                    ),
                    Container(
                      margin:
                          const EdgeInsetsDirectional.symmetric(vertical: 5),
                      child: const Text(
                        "Nate Berkus",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text("Celebrity Interior Designer"),
                    Container(
                      height: 35,
                      margin:
                          const EdgeInsetsDirectional.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, position) {
                              return const Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              );
                            },
                            itemCount: 5,
                          ),
                          Container(
                            margin: const EdgeInsetsDirectional.symmetric(
                                horizontal: 5),
                            child: const Text(
                              "5.00",
                              style: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Text("( 32 )"),
                        ],
                      ),
                    ),
                    const Text(
                      "About me",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsetsDirectional.symmetric(vertical: 5),
                      child: const Text(
                        'Founder of Drybar (Sold for \$255M)\nGrew Drybar to 150 locations across the US with products sold at Sephora, Nordstrom, Ulta Beauty, Macy’s\nNotables:\n' +
                            "Guest 🦈 on Shark Tank Cover of Inc Magazine’s “How I Did This” issue 100 Most Creative People in Business” by Fast Company  Featured on Fortune magazine’s “40 Under 40” list"
                                "Guest 🦈 on Shark Tank Cover of Inc Magazine’s “How I Did This” issue 100 Most Creative People in Business” by Fast Company  Featured on Fortune magazine’s “40 Under 40” list"
                                "Guest 🦈 on Shark Tank Cover of Inc Magazine’s “How I Did This” issue 100 Most Creative People in Business” by Fast Company  Featured on Fortune magazine’s “40 Under 40” list" +
                            "Guest 🦈 on Shark Tank Cover of Inc Magazine’s “How I Did This” issue 100 Most Creative People in Business” by Fast Company  Featured on Fortune magazine’s “40 Under 40” list",
                        style: TextStyle(height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 5),
                        child: const Text(
                          '\$900 . Session',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: Row(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                  size: 15.0,
                                );
                              },
                              itemCount: 5,
                            ),
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                start: 10,
                                end: 10,
                              ),
                              child: const Text(
                                "5.00",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            const Text("( 32 )"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "See Plans",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
