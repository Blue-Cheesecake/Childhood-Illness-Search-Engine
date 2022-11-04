import 'package:childhood_illness_search_engine/common/profile_bar.dart';
import 'package:childhood_illness_search_engine/common/search_bar.dart';
import 'package:childhood_illness_search_engine/models/illness_list/illness_list.dart';
import 'package:childhood_illness_search_engine/res/fake_data.dart';
import 'package:childhood_illness_search_engine/screens/home/components/illness.dart';
import 'package:childhood_illness_search_engine/screens/home/components/search_result.dart';
import 'package:childhood_illness_search_engine/screens/home/res/container_status.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currStatus = ContainerStatus.IDLING;
  var queryText = "";

  // For passing to search result page
  List<IllnessElement> illnessList = [];

  // For passing to illness page
  IllnessElement illness = IllnessElement(
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
    // TODO: Implement on search function here
    // fake data
    illnessList = FakeData.fakeIllnessList;
    //
  }

  void setStateOnTabViewIllnessFromHome(
    ContainerStatus s,
    IllnessElement illnessElement,
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
      currentContainerChild = SearchResult(
        queryText: queryText,
        illnessList: illnessList,
        callback: setStateOnTabViewIllnessFromHome,
      );
    }
    if (currStatus == ContainerStatus.VIEW_ILLNESS) {
      currentContainerChild = Illness(illnessModel: illness);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ProfileBar(),
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  child: SearchBar(
                    callback: setStateOnSearchFromHome,
                  ),
                ),
                const SizedBox(height: 30),
                currentContainerChild,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
