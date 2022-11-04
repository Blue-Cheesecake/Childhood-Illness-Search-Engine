import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({Key? key, required this.symptomsTxt}) : super(key: key);

  final String symptomsTxt;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text("Symptoms"),
    );
  }
}
