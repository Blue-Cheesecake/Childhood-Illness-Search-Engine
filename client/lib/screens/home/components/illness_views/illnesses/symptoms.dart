import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({Key? key, required this.symptomsTxt}) : super(key: key);

  final String symptomsTxt;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Symptoms",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            symptomsTxt,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
