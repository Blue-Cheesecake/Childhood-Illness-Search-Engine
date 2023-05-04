import 'package:childhood_illness_search_engine/core/utils/build_illness_util.dart';
import 'package:flutter/material.dart';

class SymptomsWidget extends StatelessWidget {
  const SymptomsWidget({Key? key, required this.symptomsTxt}) : super(key: key);

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
