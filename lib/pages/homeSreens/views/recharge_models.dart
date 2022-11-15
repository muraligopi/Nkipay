// To parse this JSON data, do
//
//     final arechargeGetPostModel = arechargeGetPostModelFromJson(jsonString);

import 'dart:convert';
import 'package:Nkipay/utils/showSnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

ArechargeGetPostModel arechargeGetPostModelFromJson(String str) =>
    ArechargeGetPostModel.fromJson(json.decode(str));

String arechargeGetPostModelToJson(ArechargeGetPostModel data) =>
    json.encode(data.toJson());

class ArechargeGetPostModel {
  ArechargeGetPostModel({
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
  });

  int? orderId;
  String? urid;
  String? mobile;
  String? status;
  String? amount;
  String? transId;
  String? lapuNumber;
  int? bal;
  int? roffer;
  String? resText;

  factory ArechargeGetPostModel.fromJson(Map<String, dynamic> json) =>
      ArechargeGetPostModel(
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
        "orderId": orderId,
        "urid": urid,
        "mobile": mobile,
        "status": status,
        "amount": amount,
        "transId": transId,
        "lapuNumber": lapuNumber,
        "bal": bal,
        "roffer": roffer,
        "resText": resText,
      };
}

class recharge {
  Future<dynamic> get(
    String api,
  ) async {
    var url = Uri.parse(api);

    var _headers = {
      "x-Requested-With": "Web",
      //"Host": "https://mineral-order-264306.web.app/",
      //"Content-Type": "application/json",
      //"Accept": "application/json"
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    };
    var response = await http.get(url, headers: _headers);
    if (response.statusCode == 200) {
      final praseid = json.decode(response.body);
      final responsestring = ArechargeGetPostModel.fromJson(praseid);
      print(responsestring.resText);
      return responsestring;
    } else if (response.statusCode == 404) {
      print('bad request');
      return 'bad req';
    } else {
      return 'failed';
    }
  }
}
