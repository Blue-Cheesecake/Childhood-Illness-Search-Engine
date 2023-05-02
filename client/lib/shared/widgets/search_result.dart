import 'package:childhood_illness_search_engine/models/illness_list.dart';
import 'package:childhood_illness_search_engine/screens/home/res/container_status.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
    required this.illnessList,
    required this.callback,
  }) : super(key: key);

  final List<IllnessElement> illnessList;
  final Function(ContainerStatus, IllnessElement) callback;

  void _clickedIllness(IllnessElement currIllness) {
    callback(ContainerStatus.VIEW_ILLNESS, currIllness);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: illnessList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final illness = illnessList.elementAt(index);
            return GestureDetector(
              onTap: () => _clickedIllness(illness),
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
          }),
    );
  }
}
