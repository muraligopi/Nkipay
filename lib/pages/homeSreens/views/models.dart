// To parse this JSON data, do
//
//     final arechargeModel = arechargeModelFromJson(jsonString);

import 'dart:convert';

ArechargeModel arechargeModelFromJson(String str) =>
    ArechargeModel.fromJson(json.decode(str));

String arechargeModelToJson(ArechargeModel data) => json.encode(data.toJson());

class ArechargeModel {
  ArechargeModel({
    this.orderId,
    this.urid,
    this.mobile,
    this.status,
    this.amount,
    this.transId,
    this.lapuNumber,
    this.bal,
    this.roffer,
    this.resText,
    this.opid,
    this.stv,
    this.cirleId,
    this.userId,
    this.token,
  });

  int? orderId;
  String? urid;
  String? mobile;
  String? status;
  String? amount;
  String? transId;
  String? lapuNumber;
  String? bal;
  String? roffer;
  String? resText;
  String? token;
  String? opid;
  String? stv;
  String? cirleId;
  String? userId;

  factory ArechargeModel.fromJson(Map<String, dynamic> json) => ArechargeModel(
        orderId: json["orderId"],
        urid: json["urid"],
        mobile: json["mobile"],
        status: json["status"],
        amount: json["amount"],
        transId: json["transId"],
        lapuNumber: json["lapuNumber"],
        bal: json["bal"],
        roffer: json["roffer"],
        resText: json["resText"],
      );

  Map<String, dynamic> toJson() => {
        //"orderId": orderId,
        "urid": urid,
        "mobile": mobile,
        "token": token,
        "opid": opid,
        "stv": stv,
        "cirleId": cirleId,
        // "status": status,
        "amount": amount,
        "userId": userId,
        //"transId": transId,
        //"lapuNumber": lapuNumber,
        //"bal": bal,
        //"roffer": roffer,
        //"resText": resText,
      };
}
