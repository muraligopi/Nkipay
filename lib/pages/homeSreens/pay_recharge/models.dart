// To parse this JSON data, do
//
//     final payrechargeModel = payrechargeModelFromJson(jsonString);

import 'dart:convert';

PayrechargeModel payrechargeModelFromJson(String str) =>
    PayrechargeModel.fromJson(json.decode(str));

String payrechargeModelToJson(PayrechargeModel data) =>
    json.encode(data.toJson());

class PayrechargeModel {
  PayrechargeModel({
    this.payrechargeModelOperator,
    this.circle,
    this.status,
    this.message,
  });

  String? payrechargeModelOperator;
  String? circle;
  String? status;
  String? message;

  factory PayrechargeModel.fromJson(Map<String, dynamic> json) =>
      PayrechargeModel(
        payrechargeModelOperator: json["operator"],
        circle: json["circle"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "operator": payrechargeModelOperator,
        "circle": circle,
        "status": status,
        "message": message,
      };
}
