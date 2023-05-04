import 'package:childhood_illness_search_engine/core/enums/container_status.dart';
import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:childhood_illness_search_engine/providers/favourite_list_provider.dart';
import 'package:childhood_illness_search_engine/shared/widgets/illness_views/illness_main_widget.dart';
import 'package:childhood_illness_search_engine/shared/widgets/search_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  ContainerStatus containerStatus = ContainerStatus.SEARCH_RESULT;

  late IllnessElementModel selectedIllness;

  @override
  Widget build(BuildContext context) {
    FavouriteListProvider favProvider =
        Provider.of<FavouriteListProvider>(context);
    List<IllnessElementModel> illnessList = favProvider.illnessList;

    late Widget containerChild;

    if (containerStatus == ContainerStatus.SEARCH_RESULT) {
      containerChild = SearchResultWidget(
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
