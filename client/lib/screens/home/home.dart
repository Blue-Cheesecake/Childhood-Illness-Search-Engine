import 'package:childhood_illness_search_engine/common/profile_bar.dart';
import 'package:childhood_illness_search_engine/common/search_bar.dart';
import 'package:childhood_illness_search_engine/screens/home/res/container_status.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContainerStatus currStatus = ContainerStatus.DOWN;

  void setStateOnSearchFromHome(ContainerStatus s) {
    setState(() {
      currStatus = s;
      if (s == ContainerStatus.UP) {
        print("UP");
      } else {
        print("DOWN");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    late final double currentContainerHeight;

    if (currStatus == ContainerStatus.DOWN) {
      currentContainerHeight = mediaSize.height * 0.55;
    } else {
      currentContainerHeight = mediaSize.height * 0.70;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ProfileBar(),
        Container(
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          width: double.infinity,
          height: currentContainerHeight,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              child: SearchBar(
                callback: setStateOnSearchFromHome,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
