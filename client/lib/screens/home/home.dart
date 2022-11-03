import 'package:childhood_illness_search_engine/common/profile_bar.dart';
import 'package:childhood_illness_search_engine/common/search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

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
          height: mediaSize.height * 0.55,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              child: SearchBar(),
            ),
          ),
        ),
      ],
    );
  }
}
