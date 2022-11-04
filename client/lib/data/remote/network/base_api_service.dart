abstract class BaseApiService {
  final String baseUrl = "http://127.0.0.1:5000/";

  Future<dynamic> getResponse(String url);
}
