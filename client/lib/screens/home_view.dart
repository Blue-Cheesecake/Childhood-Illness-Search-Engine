
import 'package:childhood_illness_search_engine/core/enums/container_status.dart';
import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:childhood_illness_search_engine/services/illness_list_service.dart';
import 'package:childhood_illness_search_engine/shared/widgets/illness_views/illness_main_widget.dart';
import 'package:childhood_illness_search_engine/shared/widgets/search_bar_widget.dart';
import 'package:childhood_illness_search_engine/shared/widgets/search_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var currStatus = ContainerStatus.IDLING;
  var queryText = "";
  late final IllnessListService _illnessListService;

  @override
  void initState() {
    super.initState();
    _illnessListService =
        Provider.of<IllnessListService>(context, listen: false);
  }

  // For passing to search result page
  List<IllnessElementModel> illnessList = [];

  // For passing to illness page
  IllnessElementModel illness = IllnessElementModel(
    name: "",
    description: "",
    symptoms: "",
    treating: "",
    preventing: "",
    common: false,
    link: "",
  );

  void setStateOnSearchFromHome(ContainerStatus s, String txt) {
    setState(() {
      currStatus = s;
      queryText = txt;
    });
  }

  void setStateOnTabViewIllnessFromHome(
    ContainerStatus s,
    IllnessElementModel illnessElement,
  ) {
    setState(() {
      currStatus = s;
      illness = illnessElement;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    late final double currentContainerHeight;

    if (currStatus == ContainerStatus.IDLING) {
      currentContainerHeight = mediaSize.height * 0.55;
    } else {
      currentContainerHeight = mediaSize.height * 0.70;
    }

    // IDLING is empty
    Widget currentContainerChild = const SizedBox.shrink();
    if (currStatus == ContainerStatus.SEARCH_RESULT) {
      currentContainerChild = FutureBuilder(
        future:
            _illnessListService.getIllnessListBySearching(context, queryText),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return SearchResultWidget(
            illnessList: snapshot.data as List<IllnessElementModel>,
            callback: setStateOnTabViewIllnessFromHome,
          );
        },
      );
    }
    if (currStatus == ContainerStatus.VIEW_ILLNESS) {
      currentContainerChild = IllnessMainWidget(illnessModel: illness);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.fastOutSlowIn,
          width: double.infinity,
          height: currentContainerHeight,
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: SearchBarWidget(
                  callback: setStateOnSearchFromHome,
                ),
              ),
              const SizedBox(height: 30),
              currentContainerChild,
            ],
          ),
        ),
      ],
    );
  }
}
