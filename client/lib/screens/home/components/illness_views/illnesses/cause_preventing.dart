import 'package:childhood_illness_search_engine/screens/home/res/utilities.dart';
import 'package:flutter/material.dart';

class CausePreventing extends StatelessWidget {
  const CausePreventing({Key? key, required this.cpTxt}) : super(key: key);

  final String cpTxt;

  @override
  Widget build(BuildContext context) {
    var sections = cpTxt.split("\n");

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cause/ Preventing",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 7),
          listIllness(sections),
        ],
      ),
    );
  }
}
