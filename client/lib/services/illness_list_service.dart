import 'package:childhood_illness_search_engine/models/illness_element_model.dart';
import 'package:childhood_illness_search_engine/models/illness_list_model.dart';
import 'package:childhood_illness_search_engine/repository/illness_list_repository.dart';

class IllnessListService {
  final IllnessListRepository _repo = IllnessListRepository();

  Future<List<IllnessElementModel>> getIllnessListBySearching(String q) async {
    final IllnessListModel illnessListModel = await _repo.fetchIllnessList(q);
    return illnessListModel.illnessList;
  }
}
