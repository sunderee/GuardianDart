import 'package:guardiandart/src/api/models/type.dart';

class TagsModel {
  String? id;
  Type? type;
  String? webTitle;
  String? webUrl;
  String? apiUrl;
  String? paidContentType;
  String? sectionId;
  String? sectionName;

  TagsModel._({
    this.id,
    this.type,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
    this.paidContentType,
    this.sectionId,
    this.sectionName,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel._(
        id: json['id'],
        type: TYPE_VALUES.map[json['type']],
        webTitle: json['webTitle'],
        webUrl: json['webUrl'],
        apiUrl: json['apiUrl'],
        paidContentType: json['paidContentType'],
        sectionId: json['sectionId'],
        sectionName: json['sectionName'],
      );
}
