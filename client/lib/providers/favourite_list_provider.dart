import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:flutter/material.dart';

class FavouriteListProvider extends ChangeNotifier {
  final List<IllnessElementModel> _illnessList = [];

  List<IllnessElementModel> get illnessList => _illnessList;

  void addIllness(IllnessElementModel element) {
    _illnessList.add(element);
    notifyListeners();
  }

  void removeIllness(IllnessElementModel element) {
    _illnessList.remove(element);
    notifyListeners();
  }
}
