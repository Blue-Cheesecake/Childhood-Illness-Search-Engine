import 'package:flutter/material.dart';

class CausePreventing extends StatelessWidget {
  const CausePreventing({Key? key, required this.cpTxt}) : super(key: key);

  final String cpTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Cause Preventing: $cpTxt"),
    );
  }
}
