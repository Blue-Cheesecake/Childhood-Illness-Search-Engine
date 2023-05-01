import 'package:childhood_illness_search_engine/core/theme/style.dart';
import 'package:childhood_illness_search_engine/models/illness_list.dart';
import 'package:childhood_illness_search_engine/screens/home/components/illness_views/illnesses/cause_preventing.dart';
import 'package:childhood_illness_search_engine/screens/home/components/illness_views/illnesses/description.dart';
import 'package:childhood_illness_search_engine/screens/home/components/illness_views/illnesses/symptoms.dart';
import 'package:childhood_illness_search_engine/screens/home/components/illness_views/illnesses/treating.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Illness extends StatefulWidget {
  const Illness({Key? key, required this.illnessModel}) : super(key: key);

  // Using illness element from illness list class
  final IllnessElement illnessModel;

  @override
  State<Illness> createState() => _IllnessState();
}

class _IllnessState extends State<Illness> {
  final PageController _controller = PageController();
  late final List<Widget> _list;

  @override
  void initState() {
    // TODO: implement initState
    _list = <Widget>[
      Description(description: widget.illnessModel.description),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20),
            child: Text(
              widget.illnessModel.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Flexible(
            child: PageView.builder(
              controller: _controller,
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _list.elementAt(index),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: _list.length,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: PrimaryColor.littleDarkBlue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
