import 'package:childhood_illness_search_engine/models/illness_list/illness_list.dart';
import 'package:childhood_illness_search_engine/screens/home/components/illness_views/illnesses/cause_preventing.dart';
import 'package:childhood_illness_search_engine/screens/home/components/illness_views/illnesses/symptoms.dart';
import 'package:childhood_illness_search_engine/screens/home/components/illness_views/illnesses/treating.dart';
import 'package:flutter/material.dart';

class Illness extends StatefulWidget {
  const Illness({Key? key, required this.illnessModel}) : super(key: key);

  // Using illness element from illness list class
  final IllnessElement illnessModel;

  @override
  State<Illness> createState() => _IllnessState();
}

class _IllnessState extends State<Illness> {
  PageController _controller = PageController();
  late final List<Widget> _list;

  @override
  void initState() {
    // TODO: implement initState
    _list = <Widget>[
      Symptoms(symptomsTxt: widget.illnessModel.symptoms),
      Treating(treatingTxt: widget.illnessModel.treating),
      CausePreventing(cpTxt: widget.illnessModel.preventing),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(widget.illnessModel.name),
          Text(widget.illnessModel.description),
          Flexible(
            child: PageView.builder(
              controller: _controller,
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return _list.elementAt(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
