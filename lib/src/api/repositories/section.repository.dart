import 'dart:convert';

import 'package:guardiandart/src/api/api.provider.dart';
import 'package:guardiandart/src/api/models/section.model.dart';
import 'package:guardiandart/src/utils/isolate.utils.dart';

abstract class _ISectionRepository {
  Future<List<SectionModel>> fetchSections(String apiKey, {String? query});
}

class SectionRepository implements _ISectionRepository {
  static final SectionRepository _instance = SectionRepository._();

  SectionRepository._();
  factory SectionRepository.instance() => _instance;

  @override
  Future<List<SectionModel>> fetchSections(
    String apiKey, {
    String? query,
  }) async {
    final Map<String, String> queryParameters = {
      'api-key': apiKey,
      'q': query ?? '',
    }..removeWhere((_, String value) => value.isEmpty);
    return await compute<ApiProviderModel, List<SectionModel>>(
      _parseFetchSections,
      ApiProviderModel(
        ApiProvider.BASE_URL,
        'sections',
        queryParams: queryParameters,
      ),
    );
  }
}

Future<List<SectionModel>> _parseFetchSections(ApiProviderModel request) async {
  final provider = ApiProvider.instance();
  final result = await provider.makeGetRequest(
    request.baseURL,
    request.endpoint,
    queryParams: request.queryParams,
  );
  return result != null
      ? (json.decode(result)['response']['results'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((element) => SectionModel.fromJson(element))
          .toList()
      : <SectionModel>[];
}
