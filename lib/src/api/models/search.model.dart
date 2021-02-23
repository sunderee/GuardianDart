class SearchModel {
  String? id;
  String? type;
  String? sectionId;
  String? sectionName;
  DateTime? webPublicationDate;
  String? webTitle;
  String? webUrl;
  String? apiUrl;
  bool? isHosted;
  String? pillarId;
  String? pillarName;

  SearchModel._({
    this.id,
    this.type,
    this.sectionId,
    this.sectionName,
    this.webPublicationDate,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
    this.isHosted,
    this.pillarId,
    this.pillarName,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel._(
        id: json['id'],
        type: json['type'],
        sectionId: json['sectionId'],
        sectionName: json['sectionName'],
        webPublicationDate: DateTime.parse(json['webPublicationDate']),
        webTitle: json['webTitle'],
        webUrl: json['webUrl'],
        apiUrl: json['apiUrl'],
        isHosted: json['isHosted'],
        pillarId: json['pillarId'],
        pillarName: json['pillarName'],
      );
}
