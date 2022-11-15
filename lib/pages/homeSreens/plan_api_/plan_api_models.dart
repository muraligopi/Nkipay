// To parse this JSON data, do
//
//     final planApiModel = planApiModelFromJson(jsonString);

import 'dart:convert';

PlanApiModel planApiModelFromJson(String str) =>
    PlanApiModel.fromJson(json.decode(str));

String planApiModelToJson(PlanApiModel data) => json.encode(data.toJson());

class PlanApiModel {
  PlanApiModel({
    this.error,
    this.status,
    this.mobile,
    this.planApiModelOperator,
    this.opCode,
    this.circle,
    this.circleCode,
    this.message,
  });

  String? error;
  String? status;
  String? mobile;
  String? planApiModelOperator;
  String? opCode;
  String? circle;
  String? circleCode;
  String? message;

  factory PlanApiModel.fromJson(Map<String, dynamic> json) => PlanApiModel(
        error: json["ERROR"],
        status: json["STATUS"],
        mobile: json["Mobile"],
        planApiModelOperator: json["Operator"],
        opCode: json["OpCode"],
        circle: json["Circle"],
        circleCode: json["CircleCode"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "ERROR": error,
        "STATUS": status,
        "Mobile": mobile,
        "Operator": planApiModelOperator,
        "OpCode": opCode,
        "Circle": circle,
        "CircleCode": circleCode,
        "Message": message,
      };
}
