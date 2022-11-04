import 'package:childhood_illness_search_engine/models/illness_list/illness_list.dart';
import 'package:flutter/material.dart';

class Illness extends StatelessWidget {
  const Illness({Key? key, required this.illnessModel}) : super(key: key);

  // Using illness element from illness list class
  final IllnessElement illnessModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(illnessModel.name),
        Text(illnessModel.description),
        Text(illnessModel.symptoms),
      ],
    );
  }
}
