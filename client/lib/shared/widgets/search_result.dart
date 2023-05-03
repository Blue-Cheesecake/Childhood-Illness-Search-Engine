import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:childhood_illness_search_engine/screens/home/res/container_status.dart';
import 'package:childhood_illness_search_engine/shared/widgets/illness_card_widget.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
    required this.illnessList,
    required this.callback,
  }) : super(key: key);

  final List<IllnessElementModel> illnessList;
  final Function(ContainerStatus, IllnessElementModel) callback;

  void _clickedIllness(IllnessElementModel currIllness) {
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
          return IllnessCardWidget(
            illness: illness,
            callback: _clickedIllness,
          );
        },
      ),
    );
  }
}
