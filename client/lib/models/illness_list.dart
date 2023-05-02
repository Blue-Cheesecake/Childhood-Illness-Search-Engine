// To parse this JSON data, do
//
//     final illnessList = illnessListFromJson(jsonString);

import 'dart:convert';

IllnessList illnessListFromJson(String str) =>
    IllnessList.fromJson(json.decode(str));

String illnessListToJson(IllnessList data) => json.encode(data.toJson());

class IllnessList {
  IllnessList({
    required this.illnessList,
  });

  final List<IllnessElement> illnessList;

  factory IllnessList.fromJson(Map<String, dynamic> json) => IllnessList(
        illnessList: List<IllnessElement>.from(
            json["illness_list"].map((x) => IllnessElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "illness_list": List<dynamic>.from(illnessList.map((x) => x.toJson())),
      };
}

class IllnessElement {
  IllnessElement({
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

  factory IllnessElement.fromJson(Map<String, dynamic> json) => IllnessElement(
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
