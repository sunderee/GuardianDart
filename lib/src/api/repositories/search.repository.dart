import 'package:guardiandart/src/api/models/search.model.dart';
import 'package:guardiandart/src/utils/datetime.extension.dart';
import 'package:guardiandart/src/utils/enums.utils.dart';

abstract class _ISearchRepository {
  Future<List<SearchModel>> fetchSearches(
    String apiKey, {
    String? section,
    String? tag,
    ProductionOfficeEnum? productionOffice,
    int page = 1,
    int pageSize = 10,
    RightsEnum? rights,
    OrderByEnum orderBy = OrderByEnum.NEWEST,
    UseDateEnum? useDate,
    ShowElementsEnum? showElements,
    bool fetchArticleContents = false,
    DateTime? fromDate,
    DateTime? toDate,
  });
}

class SearchRepository implements _ISearchRepository {
  static final SearchRepository _instance = SearchRepository._();

  SearchRepository._();
  factory SearchRepository.instance() => _instance;

  @override
  Future<List<SearchModel>> fetchSearches(
    String apiKey, {
    String? section,
    String? tag,
    ProductionOfficeEnum? productionOffice,
    int page = 1,
    int pageSize = 10,
    RightsEnum? rights,
    OrderByEnum orderBy = OrderByEnum.NEWEST,
    UseDateEnum? useDate,
    ShowElementsEnum? showElements,
    bool fetchArticleContents = false,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    final Map<String, String> queryParameters = {
      'api-key': apiKey,
      'section': section ?? '',
      'tag': tag ?? '',
      'production-office': productionOffice?.value ?? '',
      'page': page.toString(),
      'page-size': pageSize.toString(),
      'rights': rights?.value ?? '',
      'order-by': orderBy.value ?? '',
      'use-date': useDate?.value ?? '',
      'show-elements': showElements?.value ?? '',
      'show-fields': fetchArticleContents ? 'body,headline' : '',
      'from-date': fromDate?.formattedDate ?? '',
      'to-date': toDate?.formattedDate ?? '',
    }..removeWhere((_, String value) => value.isEmpty);
    return <SearchModel>[];
  }
}
