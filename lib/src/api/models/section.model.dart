class SectionModel {
  String? id;
  String? webTitle;
  String? webUrl;
  String? apiUrl;
  List<SectionModel>? editions;

  SectionModel._({
    this.id,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
    this.editions,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel._(
        id: json['id'],
        webTitle: json['webTitle'],
        webUrl: json['webUrl'],
        apiUrl: json['apiUrl'],
        editions: json['editions'] != null
            ? (json['editions'] as List<dynamic>)
                .cast<Map<String, dynamic>>()
                .map((element) => SectionModel.fromJson(element))
                .toList()
            : null,
      );
}
