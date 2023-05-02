import 'package:childhood_illness_search_engine/models/illness_list.dart';
import 'package:childhood_illness_search_engine/providers/favourite_list_provider.dart';
import 'package:childhood_illness_search_engine/screens/home/res/container_status.dart';
import 'package:childhood_illness_search_engine/shared/widgets/illness_views/illness_main_widget.dart';
import 'package:childhood_illness_search_engine/shared/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  ContainerStatus containerStatus = ContainerStatus.SEARCH_RESULT;

  late IllnessElement selectedIllness;

  @override
  Widget build(BuildContext context) {
    FavouriteListProvider favProvider =
        Provider.of<FavouriteListProvider>(context);
    List<IllnessElement> illnessList = favProvider.illnessList;

    late Widget containerChild;

    if (containerStatus == ContainerStatus.SEARCH_RESULT) {
      containerChild = SearchResult(
          illnessList: illnessList,
          callback: (contStatus, illEle) {
            setState(() {
              containerStatus = contStatus;
              selectedIllness = illEle;
            });
          });
    } else {
      containerChild = IllnessMainWidget(illnessModel: selectedIllness);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Favourites",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              containerChild,
            ],
          ),
        ),
      ),
    );
  }
}
