import 'dart:io';

import 'package:guardiandart/src/api/repositories/section.repository.dart';
import 'package:guardiandart/src/api/repositories/tags.repository.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  group('API raw repositories test', () {
    final apiKey = 'test';
    final sectionsRepository = SectionRepository.instance();
    final tagsRepository = TagsRepository.instance();

    test('sections repository', () async {
      final sections = await sectionsRepository.fetchSections(apiKey);
      final aboutSection = await sectionsRepository.fetchSections(
        apiKey,
        query: 'about',
      );

      expect(sections.isNotEmpty, true);
      expect(aboutSection.length, 1);
    });

    test('tags repository', () async {
      final tags = await tagsRepository.fetchAllTags(
        apiKey,
        page: 4,
        pageSize: 11,
      );
      print(tags.map((e) => e.id));

      expect(tags.length, 11);
    });
  });
}
