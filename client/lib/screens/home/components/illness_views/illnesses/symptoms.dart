import 'package:childhood_illness_search_engine/screens/home/res/utilities.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({Key? key, required this.symptomsTxt}) : super(key: key);

  final String symptomsTxt;

  @override
  Widget build(BuildContext context) {
    var sections = symptomsTxt.split("\n\n");

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Symptoms",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 7),
          listIllness(sections),
        ],
      ),
    );
  }
}
