import 'package:childhood_illness_search_engine/res/style.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({Key? key, required this.symptomsTxt}) : super(key: key);

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
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: sections.length,
              itemBuilder: (context, index) {
                var col = <Widget>[];
                final inners = sections[index].split("\n");
                for (var element in inners) {
                  if (element[0] == "#" ||
                      (element.length >= 2 &&
                          element.substring(0, 2) == "##")) {
                    col.add(Text(
                      element.substring(1),
                      style: const TextStyle(
                        color: PrimaryColor.littleDarkBlue,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ));
                  } else {
                    col.add(Text(
                      element,
                      style: Theme.of(context).textTheme.bodySmall,
                    ));
                  }
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: col,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
