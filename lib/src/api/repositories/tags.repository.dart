import 'dart:convert';

import 'package:guardiandart/src/api/api.provider.dart';
import 'package:guardiandart/src/api/models/tags.model.dart';
import 'package:guardiandart/src/utils/isolate.utils.dart';

abstract class _ITagsRepository {
  Future<List<TagsModel>> fetchAllTags(
    String apiKey, {
    String? section,
    int page = 1,
    int pageSize = 15,
  });
}

class TagsRepository implements _ITagsRepository {
  static final TagsRepository _instance = TagsRepository._();

  TagsRepository._();
  factory TagsRepository.instance() => _instance;

  @override
  Future<List<TagsModel>> fetchAllTags(
    String apiKey, {
    String? section,
    int page = 1,
    int pageSize = 15,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'api-key': apiKey,
      'section': section,
      'page': page,
      'page-size': pageSize,
    }..removeWhere((_, dynamic value) => value == null);
    return await compute<ApiProviderModel, List<TagsModel>>(
      _parseFetchAllTags,
      ApiProviderModel(
        ApiProvider.BASE_URL,
        'tags',
        queryParams: queryParameters,
      ),
    );
  }
}

Future<List<TagsModel>> _parseFetchAllTags(ApiProviderModel request) async {
  final ApiProvider provider = ApiProvider.instance();
  final result = await provider.makeGetRequest(
    request.baseURL,
    request.endpoint,
    queryParams: request.queryParams,
  );
  return result != null
      ? (json.decode(result)['response']['results'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((element) => TagsModel.fromJson(element))
          .toList()
      : <TagsModel>[];
}
