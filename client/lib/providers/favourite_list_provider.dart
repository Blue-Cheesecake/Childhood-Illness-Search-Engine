import 'package:childhood_illness_search_engine/models/illness_list.dart';
import 'package:flutter/material.dart';

class FavouriteListProvider extends ChangeNotifier {
  final List<IllnessElement> _illnessList = [];

  List<IllnessElement> get illnessList => _illnessList;

  void addIllness(IllnessElement element) {
    _illnessList.add(element);
    notifyListeners();
  }

  void removeIllness(IllnessElement element) {
    _illnessList.remove(element);
    notifyListeners();
  }
}
