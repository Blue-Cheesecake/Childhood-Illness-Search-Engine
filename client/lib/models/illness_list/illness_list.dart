// To parse this JSON data, do
//
//     final illnessList = illnessListFromJson(jsonString);

import 'dart:convert';

IllnessList illnessListFromJson(String str) =>
    IllnessList.fromJson(json.decode(str));

String illnessListToJson(IllnessList data) => json.encode(data.toJson());

class IllnessList {
  IllnessList({
    required this.list,
  });

  final List<IllnessElement> list;

  factory IllnessList.fromJson(Map<String, dynamic> json) => IllnessList(
        list: List<IllnessElement>.from(
            json["list"].map((x) => IllnessElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
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
  });

  final String name;
  final String description;
  final String symptoms;
  final String treating;
  final String preventing;
  final bool common;

  factory IllnessElement.fromJson(Map<String, dynamic> json) => IllnessElement(
        name: json["name"],
        description: json["description"],
        symptoms: json["symptoms"],
        treating: json["treating"],
        preventing: json["preventing"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "symptoms": symptoms,
        "treating": treating,
        "preventing": preventing,
        "common": common,
      };
}
