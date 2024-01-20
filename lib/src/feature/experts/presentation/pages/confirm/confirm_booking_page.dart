import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:unknown/src/core/router/app_router.dart';

import '../../../../../../common/images.dart';
import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../data/models/expert_model.dart';

class ConfirmBookingPage extends StatelessWidget {
  ExpertModel expert;

  ConfirmBookingPage({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        showBackArrow: true,
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 90,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder: Images.ic_place_holder,
                          image:
                              "http://192.168.1.13:8080${expert.avatarUrl ?? ""}",
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              Images.ic_place_holder,
                              fit: BoxFit.fitWidth,
                            );
                          },
                          fit: BoxFit.fill,
                          height: 90,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        expert.nameEn ?? "",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        expert.titleEn ?? "",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "THU, 8/31\n4:00pm - 4:45pm EET",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                top: 15,
              ),
              child: const Text(
                "Enter your email address",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                top: 5,
              ),
              child: const Text(
                "we will send you confirmation mail on your inbox",
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                top: 10,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                top: 15,
                bottom: 15,
              ),
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'By continuing you agree to our ',
                    children: [
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blueAccent,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                appRouter.push(const SuccessRoute());
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
                onSurface: Colors.grey,
              ),
              child: const Text(
                "Confirm",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
