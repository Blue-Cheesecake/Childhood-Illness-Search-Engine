// To parse this JSON data, do
//
//     final illnessList = illnessListFromJson(jsonString);

import 'dart:convert';

import 'package:childhood_illness_search_engine/models/illness_element_model.dart';

IllnessListModel illnessListFromJson(String str) =>
    IllnessListModel.fromJson(json.decode(str));

String illnessListToJson(IllnessListModel data) => json.encode(data.toJson());

class IllnessListModel {
  IllnessListModel({
    required this.illnessList,
  });

  final List<IllnessElementModel> illnessList;

  factory IllnessListModel.fromJson(Map<String, dynamic> json) =>
      IllnessListModel(
        illnessList: List<IllnessElementModel>.from(
            json["illness_list"].map((x) => IllnessElementModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "illness_list": List<dynamic>.from(illnessList.map((x) => x.toJson())),
      };
}
