import 'dart:convert';

import 'package:Nkipay/pages/homeSreens/pay_recharge/models.dart';
import 'package:Nkipay/utils/showSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/js.dart';

String pay_recharge_status = "";
String pay_recharge_msg = "";
String pay_recharge_oper = "";
String pay_recharge_circle = "";

class pay_recharge {
  //working well get method
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
      final responsestring = PayrechargeModel.fromJson(praseid);
      pay_recharge_status = responsestring.status!;
      pay_recharge_msg = responsestring.message!;
      pay_recharge_circle = responsestring.circle!;
      pay_recharge_oper = responsestring.payrechargeModelOperator!;
      print(pay_recharge_status + "  " + pay_recharge_msg);
      print(responsestring.status);
      print(responsestring.payrechargeModelOperator);
      print(responsestring.circle);
      print(responsestring.message);
      return responsestring;
    } else if (response.statusCode == 404) {
      print('bad request');
      return 'bad req';
    } else {
      return 'failed';
    }
  } ///////////////////////

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(api);
    var _payload = json.encode(object);
    var _headers = {
      "x-requested-with": "Web",
      //"Host": "https://mineral-order-264306.web.app/",
      //"Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    };
    // var _body = {
    //   "mobile": "7871969868",
    //   "amount": "1",
    //   "opid": "1",
    //   "urid": "0006",
    //   "cirleId": "6",
    //   "stv": "1",
    //   "token": "OT9sCg2FAS2VC4x",
    //   "userId": "userId",
    // };
    var response = await http.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final praseid = json.decode(response.body);
      final responsestring = PayrechargeModel.fromJson(praseid);
      print(responsestring.message);
      return responsestring;
    } else if (response.statusCode == 404) {
      print('bad request');
      return 'bad req';
    } else {
      return 'failed';
    }
  }
}
