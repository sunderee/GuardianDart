import 'dart:io';

import 'package:guardiandart/src/api/repositories/section.repository.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  group('API raw repositories test', () {
    final apiKey = 'test';
    final sectionsRepository = SectionRepository.instance();

    test('sections repository', () async {
      final sections = await sectionsRepository.fetchSections(apiKey);
      final aboutSection = await sectionsRepository.fetchSections(
        apiKey,
        query: 'about',
      );

      expect(sections.isNotEmpty, true);
      expect(aboutSection.length, 1);
    });
  });
}
