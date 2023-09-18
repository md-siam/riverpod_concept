class SuggestionModel {
  final String activity;
  final String type;
  final String link;
  final String key;
  SuggestionModel({
    required this.activity,
    required this.type,
    required this.link,
    required this.key,
  });

  factory SuggestionModel.fromJson(Map<String, dynamic> json) =>
      SuggestionModel(
        activity: json["activity"],
        type: json["type"],
        link: json["link"],
        key: json["key"],
      );
}
