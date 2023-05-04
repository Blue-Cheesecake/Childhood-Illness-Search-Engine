import 'package:childhood_illness_search_engine/core/utils/build_illness_util.dart';
import 'package:flutter/material.dart';

class TreatingWidget extends StatelessWidget {
  const TreatingWidget({Key? key, required this.treatingTxt}) : super(key: key);

  final String treatingTxt;

  @override
  Widget build(BuildContext context) {
    var sections = treatingTxt.split("\n");

    print(sections);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Treating",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 7),
          listIllness(sections),
        ],
      ),
    );
  }
}
