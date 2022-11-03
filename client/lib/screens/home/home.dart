import 'package:childhood_illness_search_engine/common/profile_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            ProfileBar(),
            Card(
              shape: RoundedRectangleBorder(),
              elevation: 0,
              child: SizedBox(
                height: 200,
                width: 200,
                child: Text("Search bar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
