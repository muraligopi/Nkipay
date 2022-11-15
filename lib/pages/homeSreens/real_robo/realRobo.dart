import 'dart:convert';
import 'dart:io';

import 'package:Nkipay/pages/homeSreens/real_robo/real_robo_models.dart';
import 'package:Nkipay/pages/homeSreens/views/models.dart';
import 'package:Nkipay/pages/homeSreens/views/status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://arecharge.in/api';
String realRobo_status = '';
String realRobo_msg = "";
String realRobo_txid = '';

class realRobo {
  // ignore: non_constant_identifier_names
  //var Client = http.Client();
  var now = DateTime.now().toString();
  // working api for arecgarge get
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
      final responsestring = RealRoboModel.fromJson(praseid);
      realRobo_msg = responsestring.message!;
      realRobo_status = responsestring.status!;
      realRobo_txid = responsestring.txid!;
      print("Real robo status");
      print(responsestring.message);
      print(responsestring.status);
      print(responsestring.txid);
      return responsestring;
    } else if (response.statusCode == 404) {
      debugPrint('bad request');
      return 'bad req';
    } else {
      return 'failed';
    }
  } ////////

  // Future<dynamic> post(String api, dynamic object) async {
  //   var url = Uri.parse(api);
  //   var _payload = json.encode(object);
  //   var _headers = {
  //     "x-Requested-With": "Web",
  //     //"Host": "https://mineral-order-264306.web.app/",
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     "Access-Control-Allow-Origin": "*",
  //     "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
  //   };

  //   var response = await http.post(url, body: _payload, headers: _headers);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     final praseid = json.decode(response.body);
  //     final responsestring = ArechargeModel.fromJson(praseid);
  //     print(responsestring.resText);
  //     return responsestring;
  //   } else if (response.statusCode == 404) {
  //     debugPrint('bad request');
  //     return 'bad req';
  //   } else {
  //     return 'failed';
  //   }
  // }///////// tesing

  Future<dynamic> post(String api) async {
    var url = Uri.parse(api);
    // var _payload = json.encode(object);
    var _headers = {
      "x-requested-with": "XMLHttpRequest",
      //"Host": "https://mineral-order-264306.web.app/",
      //"Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    };
    var _body = {
      "mobile": "7871969868",
      "amount": "1",
      "opid": "1",
      "urid": "0006",
      "cirleId": "6",
      "stv": "1",
      "token": "OT9sCg2FAS2VC4x",
      "userId": "userId",
    };
    var response = await http.post(url, body: _body, headers: _headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final praseid = json.decode(response.body);
      final responsestring = ArechargeModel.fromJson(praseid);
      print(responsestring.resText);
      return responsestring;
    } else if (response.statusCode == 404) {
      debugPrint('bad request');
      return 'bad req';
    } else {
      return 'failed';
    }
  }
}
