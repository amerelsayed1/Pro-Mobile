import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeBuilder extends StatelessWidget {

  String time;

   TimeBuilder({required this.time,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          3,
        ),
      ),
      child:  Column(
        children: [
          Center(
            child: Text(
              time,
            ),
          ),
          const Visibility(
            visible: false,
            child: Center(
              child: Text(
                "(Sold Out)",
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
