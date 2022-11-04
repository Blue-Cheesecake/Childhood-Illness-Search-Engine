import 'package:flutter/material.dart';

class Treating extends StatelessWidget {
  const Treating({Key? key, required this.treatingTxt}) : super(key: key);

  final String treatingTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Treating $treatingTxt"),
    );
  }
}
