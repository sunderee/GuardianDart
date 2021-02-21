import 'dart:convert';
import 'dart:io';

class ApiProvider {
  static final ApiProvider _instance = ApiProvider._();
  static final String BASE_URL = 'content.guardianapis.com';
  final HttpClient _client = HttpClient();

  ApiProvider._();
  factory ApiProvider.instance() => _instance;

  Future<String?> makeGetRequest(
    String baseURL,
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = Uri.https(baseURL, endpoint, queryParams);
    final request = await _client.getUrl(uri)
      ..headers.contentType = ContentType.json;
    final result = await request.close();

    if (result.statusCode == 200) {
      String rawResponse = '';
      await result
          .transform(Utf8Decoder(allowMalformed: true))
          .forEach((String element) => rawResponse += element);
      return rawResponse;
    }
  }
}

class ApiProviderModel {
  final String baseURL;
  final String endpoint;
  final Map<String, dynamic>? queryParams;

  const ApiProviderModel(
    this.baseURL,
    this.endpoint, {
    this.queryParams,
  });
}
