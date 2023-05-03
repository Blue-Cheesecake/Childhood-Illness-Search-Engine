import 'package:childhood_illness_search_engine/data/remote/network/api_end_point.dart';
import 'package:childhood_illness_search_engine/data/remote/network/network_api_service.dart';
import 'package:childhood_illness_search_engine/models/illness_list_model.dart';

class IllnessListRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<IllnessListModel> fetchIllnessList(String query) async {
    final dynamic response =
        await _apiService.getResponse(ApiEndPoints().getIllnessList + query);
    return IllnessListModel.fromJson(response);
  }
}
