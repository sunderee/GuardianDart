import 'package:guardiandart/guardiandart.dart';

Future<void> main() async {
  final apiKey = 'test';
  print('This example will attempt retrieving sections, tags and searches\n');

  print('=== SECTIONS ===');
  final sectionsRepository = SectionRepository.instance();
  final sections = await sectionsRepository.fetchSections(
    apiKey,
    query: 'us politics',
  );
  sections.forEach(
    (element) => print(
      'Section: ${element.id}\n${element.webUrl}',
    ),
  );

  print('\n=== TAGS ===');
  final tagsRepository = TagsRepository.instance();
  final tags = await tagsRepository.fetchAllTags(
    apiKey,
    page: 2,
    pageSize: 5,
  );
  tags.forEach(
    (element) => print(
      'Tag: ${element.id}, ${element.type}',
    ),
  );

  print('\n=== SEARCHES ===');
  final searchRepository = SearchRepository.instance();
  final searches = await searchRepository.fetchSearches(
    apiKey,
    pageSize: 5,
    fetchArticleContents: true,
  );
  searches.forEach(
    (element) => print(
      '${element.contents?.headline}\n${element.webUrl}',
    ),
  );
}
