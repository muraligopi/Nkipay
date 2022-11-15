import 'dart:convert';
import 'dart:io';

import 'package:Nkipay/pages/homeSreens/plan_api_/plan_api_models.dart';
import 'package:Nkipay/pages/homeSreens/views/models.dart';
import 'package:Nkipay/pages/homeSreens/views/status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://arecharge.in/api';
var plan_api_Operator = "";
var plan_api_number = '';

class check_op_plan_api {
  // ignore: non_constant_identifier_names
  //var Client = http.Client();
  var now = DateTime.now().toString();
  Future<dynamic> get(
    String api,
  ) async {
    var url = Uri.parse(api);

    var _headers = {
      "x-Requested-With": "Web",
      //"Host": "https://mineral-order-264306.web.app/",
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Charset": 'UTF-8',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    };
    var response = await http.get(url, headers: _headers);
    if (response.statusCode == 200) {
      final praseid = json.decode(response.body);
      final responsestring = PlanApiModel.fromJson(praseid);
      debugPrint(responsestring.planApiModelOperator);
      plan_api_Operator = responsestring.planApiModelOperator!;
      plan_api_number = responsestring.mobile!;
      debugPrint(responsestring.message);
      return responsestring;
    } else if (response.statusCode == 404) {
      debugPrint('bad request');
      return 'bad req';
    } else {
      return 'failed';
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(api);
    var _payload = json.encode(object);
    var _headers = {
      "x-Requested-With": "Web",
      //"Host": "https://mineral-order-264306.web.app/",
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    };
    var response = await http.post(url, body: _payload, headers: _headers);
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
