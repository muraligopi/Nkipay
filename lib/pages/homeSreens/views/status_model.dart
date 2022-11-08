// To parse this JSON data, do
//
//     final arechargeStatusModel = arechargeStatusModelFromJson(jsonString);

import 'dart:convert';

ArechargeStatusModel arechargeStatusModelFromJson(String str) =>
    ArechargeStatusModel.fromJson(json.decode(str));

String arechargeStatusModelToJson(ArechargeStatusModel data) =>
    json.encode(data.toJson());

class ArechargeStatusModel {
  ArechargeStatusModel({
    this.bal,
    this.resText,
  });

  String? bal;
  String? resText;

  factory ArechargeStatusModel.fromJson(Map<String, dynamic> json) =>
      ArechargeStatusModel(
        bal: json["bal"],
        resText: json["resText"],
      );

  Map<String, dynamic> toJson() => {
        "bal": bal,
        "resText": resText,
      };
}

// class LapuList {
//     LapuList({
//         this.lapuId,
//         this.lapuNumber,
//         this.lapuBal,
//         this.lapuListOperator,
//     });

//     String lapuId;
//     String lapuNumber;
//     String lapuBal;
//     String lapuListOperator;

//     factory LapuList.fromJson(Map<String, dynamic> json) => LapuList(
//         lapuId: json["lapuId"],
//         lapuNumber: json["lapuNumber"],
//         lapuBal: json["lapuBal"],
//         lapuListOperator: json["operator"],
//     );

//     Map<String, dynamic> toJson() => {
//         "lapuId": lapuId,
//         "lapuNumber": lapuNumber,
//         "lapuBal": lapuBal,
//         "operator": lapuListOperator,
//     };
// }
