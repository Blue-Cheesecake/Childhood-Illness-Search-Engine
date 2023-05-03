import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:childhood_illness_search_engine/models/illness_list_model.dart';
import 'package:childhood_illness_search_engine/providers/favourite_list_provider.dart';
import 'package:childhood_illness_search_engine/repository/illness_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IllnessListService {
  late final IllnessListRepository _repo;

  IllnessListService(IllnessListRepository repository) {
    _repo = repository;
  }

  Future<List<IllnessElementModel>> getIllnessListBySearching(
      BuildContext context, String query) async {
    final IllnessListModel illnessListModel =
        await _repo.fetchIllnessList(query);

    // change isFavorite status from FavProvider since the illnessList
    // is fresh
    List<IllnessElementModel> list = illnessListModel.illnessList;
    final List<IllnessElementModel> favList =
        // ignore: use_build_context_synchronously
        Provider.of<FavouriteListProvider>(context, listen: false).illnessList;

    list = list.map((IllnessElementModel e) {
      if (_isExistsInList(e, favList)) {
        e.isFavourite = true;
      }
      return e;
    }).toList();

    return illnessListModel.illnessList;
  }

  bool _isExistsInList(
      IllnessElementModel element, List<IllnessElementModel> list) {
    for (final IllnessElementModel e in list) {
      if (element.name == e.name) {
        return true;
      }
    }
    return false;
  }
}
