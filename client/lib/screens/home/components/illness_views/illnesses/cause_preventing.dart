import 'package:flutter/material.dart';

class CausePreventing extends StatelessWidget {
  const CausePreventing({Key? key, required this.cpTxt}) : super(key: key);

  final String cpTxt;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cause/ Preventing",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            cpTxt,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
