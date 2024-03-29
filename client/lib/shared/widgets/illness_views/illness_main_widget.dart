import 'package:childhood_illness_search_engine/core/theme/app_style.dart';
import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:childhood_illness_search_engine/shared/widgets/illness_views/illnesses/cause_preventing_widget.dart';
import 'package:childhood_illness_search_engine/shared/widgets/illness_views/illnesses/description_widget.dart';
import 'package:childhood_illness_search_engine/shared/widgets/illness_views/illnesses/symptoms_widget.dart';
import 'package:childhood_illness_search_engine/shared/widgets/illness_views/illnesses/treating_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IllnessMainWidget extends StatefulWidget {
  const IllnessMainWidget({Key? key, required this.illnessModel})
      : super(key: key);

  // Using illness element from illness list class
  final IllnessElementModel illnessModel;

  @override
  State<IllnessMainWidget> createState() => _IllnessMainWidgetState();
}

class _IllnessMainWidgetState extends State<IllnessMainWidget> {
  final PageController _controller = PageController();
  late final List<Widget> _list;

  @override
  void initState() {
    _list = <Widget>[
      DescriptionWidget(description: widget.illnessModel.description),
      SymptomsWidget(symptomsTxt: widget.illnessModel.symptoms),
      TreatingWidget(treatingTxt: widget.illnessModel.treating),
      CausePreventingWidget(cpTxt: widget.illnessModel.preventing),
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
