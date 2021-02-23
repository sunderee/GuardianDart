enum RightsEnum { SYNDICATABLE, SUBSCRIPTION_DATABASES, DEVELOPER_COMMUNITY }
enum OrderByEnum { NEWEST, OLDEST, RELEVANCE }
enum UseDateEnum { PUBLISHED, NEWSPAPER_EDITION, LAST_MODIFIED }
enum ShowElementsEnum { AUDIO, IMAGE, VIDEO, ALL }
enum ProductionOfficeEnum { UK, US, AUS }

extension RightsEnumValues on RightsEnum {
  String? get value {
    switch (this) {
      case RightsEnum.SYNDICATABLE:
        return 'syndicatable';
      case RightsEnum.SUBSCRIPTION_DATABASES:
        return 'subscription-databases';
      case RightsEnum.DEVELOPER_COMMUNITY:
        return 'developer-community';
    }
  }
}

extension OrderByEnumValues on OrderByEnum {
  String? get value {
    switch (this) {
      case OrderByEnum.NEWEST:
        return 'newest';
      case OrderByEnum.OLDEST:
        return 'oldest';
      case OrderByEnum.RELEVANCE:
        return 'relevance';
    }
  }
}

extension UseDateEnumValues on UseDateEnum {
  String? get value {
    switch (this) {
      case UseDateEnum.PUBLISHED:
        return 'published';
      case UseDateEnum.NEWSPAPER_EDITION:
        return 'newspaper-edition';
      case UseDateEnum.LAST_MODIFIED:
        return 'last-modified';
    }
  }
}

extension ShowElementsEnumValues on ShowElementsEnum {
  String? get value {
    switch (this) {
      case ShowElementsEnum.AUDIO:
        return 'audio';
      case ShowElementsEnum.IMAGE:
        return 'image';
      case ShowElementsEnum.VIDEO:
        return 'video';
      case ShowElementsEnum.ALL:
        return 'all';
    }
  }
}

extension ProductionOfficeEnumValues on ProductionOfficeEnum {
  String? get value {
    switch (this) {
      case ProductionOfficeEnum.UK:
        return 'uk';
      case ProductionOfficeEnum.US:
        return 'us';
      case ProductionOfficeEnum.AUS:
        return 'aus';
    }
  }
}
