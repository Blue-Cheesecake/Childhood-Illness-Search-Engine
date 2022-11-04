import 'package:flutter/material.dart';

class Treating extends StatelessWidget {
  const Treating({Key? key, required this.treatingTxt}) : super(key: key);

  final String treatingTxt;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Treating",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            treatingTxt,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
