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
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 10,
          end: 10,
          top: 5,
          bottom: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "https://media.intro.co/avatars/4862257n9r5p0A.jpg",
                      fit: BoxFit.fill,
                      height: 170,
                      width: double.infinity,
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
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
              margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
              child: const Row(
                children: [
                  Text("5.00"),
                  Text("(32)"),
                ],
              ),
            ),
            const Text(
              "About",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
              child: const Text(
                "For over 25 years, Nate’s approachable and elevated design philosophy had transformed countless homes around the world through his design work, home collections, books, television shows and media appearances. \n\nFor over 25 years, Nate’s approachable and elevated design philosophy had transformed countless homes around the world through his design work, home collections, books, television shows and media appearances. ",
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("900 . Session"),
                      Text("900 . Session"),
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
