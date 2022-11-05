import 'package:childhood_illness_search_engine/data/remote/network/api_end_point.dart';
import 'package:childhood_illness_search_engine/data/remote/network/network_api_service.dart';
import 'package:childhood_illness_search_engine/models/illness_list/illness_list.dart';
import 'package:flutter/material.dart';

class IllnessListVM extends ChangeNotifier {
  final _apiService = NetworkApiService();

  Future<List<IllnessElement>> getIllnessListBySearching(String q) async {
    try {
      final respJson =
          await _apiService.getResponse(ApiEndPoints().getIllnessList + q);
      return IllnessList.fromJson(respJson).illnessList;
    } catch (e) {
      rethrow;
    }
  }
}
