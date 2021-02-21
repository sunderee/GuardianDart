import 'package:guardiandart/src/utils/enum.values.dart';

enum Type { PAID_CONTENT, SERIES, KEYWORD }

const EnumValues<Type> TYPE_VALUES = EnumValues<Type>({
  "keyword": Type.KEYWORD,
  "paid-content": Type.PAID_CONTENT,
  "series": Type.SERIES
});
