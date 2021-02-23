# GuardianDart

Lightweight, null safe, zero-dependencies native Dart library for interaction with Guardian's [The Open Platform](https://open-platform.theguardian.com/) API. It enables users to browse tags, sections and searches, yet it's not opinionated, so it's up to the user to handle library's implementation.

Usage: you will need to request and use your API key via the platform. During the testing period, you can rely on `test` key.

```dart
// Import the library
import 'package:guardiandart/guardiandart.dart';

// Declare the API key
final apiKey = 'test';

// Instances of available repositories
final sectionsRepository = SectionRepository.instance();
final tagsRepository = TagsRepository.instance();
final searchRepository = SearchRepository.instance();
```
