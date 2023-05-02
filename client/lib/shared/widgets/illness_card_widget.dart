import 'package:childhood_illness_search_engine/models/illness_list.dart';
import 'package:flutter/material.dart';

class IllnessCardWidget extends StatelessWidget {
  const IllnessCardWidget(
      {Key? key, required this.illness, required this.callback})
      : super(key: key);

  final IllnessElement illness;
  final void Function(IllnessElement) callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(illness),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
        child: Card(
          elevation: 2.5,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                illness.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            subtitle: Text(
              illness.description,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
