class TagsModel {
  String? id;
  String? type;
  String? webTitle;
  String? webUrl;
  String? apiUrl;

  TagsModel._({
    this.id,
    this.type,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel._(
        id: json['id'],
        type: json['type'],
        webTitle: json['webTitle'],
        webUrl: json['webUrl'],
        apiUrl: json['apiUrl'],
      );
}
