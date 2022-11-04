import 'dart:convert';
import 'dart:io';

import 'package:childhood_illness_search_engine/data/remote/app_exception.dart';
import 'package:childhood_illness_search_engine/data/remote/network/base_api_service.dart';
import "package:http/http.dart" as http;

class NetworkApiService extends BaseApiService {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException();
    }
  }

  @override
  Future getResponse(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException();
    }

    return responseJson;
  }
}
