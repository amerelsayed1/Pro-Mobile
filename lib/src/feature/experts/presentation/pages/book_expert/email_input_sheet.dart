import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unknown/src/feature/experts/presentation/pages/confirm/confirm_booking_page.dart';

import '../../../../../../common/images.dart';
import '../../../../../core/router/route_helper.dart';
import '../../../data/models/expert_model.dart';

class EmailInputModalSheet extends StatefulWidget {
  final ExpertModel? expert;

  EmailInputModalSheet(this.expert);

  @override
  _EmailInputModalSheetState createState() => _EmailInputModalSheetState();
}

class _EmailInputModalSheetState extends State<EmailInputModalSheet> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 70,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.ic_place_holder,
                        image:
                            "http://192.168.1.13:8080${widget.expert?.avatarUrl ?? ""}",
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            Images.ic_place_holder,
                            fit: BoxFit.fitWidth,
                          );
                        },
                        fit: BoxFit.fill,
                        height: 50,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.expert?.nameEn ?? "",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.expert?.titleEn ?? "",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    const Text("THU, 8/31\n4:00pm - 4:45pm EET"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text("Enter your email address",
              style: TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 5),
          const Text("We will send you confirmation mail on your inbox"),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your email',
              contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
            ),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text.rich(
              TextSpan(
                text: 'By continuing you agree to our ',
                children: [
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  ),
                  TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Get.toNamed(RouteHelper.successStatus);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Confirm",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
