import 'package:childhood_illness_search_engine/data/remote/network/api_end_point.dart';
import 'package:childhood_illness_search_engine/data/remote/network/network_api_service.dart';
import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:childhood_illness_search_engine/models/illness_list_model.dart';
import 'package:flutter/material.dart';

class IllnessListVM extends ChangeNotifier {
  final _apiService = NetworkApiService();

  Future<List<IllnessElementModel>> getIllnessListBySearching(String q) async {
    try {
      final respJson =
          await _apiService.getResponse(ApiEndPoints().getIllnessList + q);
      await Future.delayed(const Duration(milliseconds: 500));
      return IllnessListModel.fromJson(respJson).illnessList;
    } catch (e) {
      rethrow;
    }
  }
}
