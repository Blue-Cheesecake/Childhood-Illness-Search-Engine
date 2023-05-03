class IllnessElementModel {
  IllnessElementModel({
    required this.name,
    required this.description,
    required this.symptoms,
    required this.treating,
    required this.preventing,
    required this.common,
    required this.link,
    this.isFavourite = false,
  });

  final String name;
  final String description;
  final String symptoms;
  final String treating;
  final String preventing;
  final bool common;
  final String link;
  bool isFavourite;

  factory IllnessElementModel.fromJson(Map<String, dynamic> json) =>
      IllnessElementModel(
        name: json["name"],
        description: json["description"],
        symptoms: json["symptoms"],
        treating: json["treating"],
        preventing: json["preventing"],
        common: json["common"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "symptoms": symptoms,
        "treating": treating,
        "preventing": preventing,
        "common": common,
        "link": link,
      };
}
