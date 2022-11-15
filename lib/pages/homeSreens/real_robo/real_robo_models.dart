// To parse this JSON data, do
//
//     final realRoboModel = realRoboModelFromJson(jsonString);

import 'dart:convert';

RealRoboModel realRoboModelFromJson(String str) =>
    RealRoboModel.fromJson(json.decode(str));

String realRoboModelToJson(RealRoboModel data) => json.encode(data.toJson());

class RealRoboModel {
  RealRoboModel({
    this.status,
    this.txid,
    this.message,
    this.remark,
    this.reqId,
    this.reqTime,
    this.number,
    this.amount,
    this.offer,
    this.lapu,
    this.lapuBalance,
    this.rechargeId,
  });

  String? status;
  String? txid;
  String? message;
  String? remark;
  String? reqId;
  DateTime? reqTime;
  String? number;
  int? amount;
  int? offer;
  Lapu? lapu;
  double? lapuBalance;
  int? rechargeId;

  factory RealRoboModel.fromJson(Map<String, dynamic> json) => RealRoboModel(
        status: json["status"],
        txid: json["txid"],
        message: json["message"],
        remark: json["remark"],
        reqId: json["req_id"],
        reqTime: DateTime.parse(json["req_time"]),
        number: json["number"],
        amount: json["amount"],
        offer: json["offer"],
        lapu: Lapu.fromJson(json["lapu"]),
        lapuBalance: json["lapu_balance"].toDouble(),
        rechargeId: json["recharge_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "txid": txid,
        "message": message,
        "remark": remark,
        "req_id": reqId,
        "req_time": reqTime?.toIso8601String(),
        "number": number,
        "amount": amount,
        "offer": offer,
        "lapu": lapu?.toJson(),
        "lapu_balance": lapuBalance,
        "recharge_id": rechargeId,
      };
}

class Lapu {
  Lapu({
    this.lapuId,
    this.lapuNo,
    this.balance,
  });

  int? lapuId;
  String? lapuNo;
  double? balance;

  factory Lapu.fromJson(Map<String, dynamic> json) => Lapu(
        lapuId: json["lapu_id"],
        lapuNo: json["lapu_no"],
        balance: json["balance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lapu_id": lapuId,
        "lapu_no": lapuNo,
        "balance": balance,
      };
}
