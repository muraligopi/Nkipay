// ignore: file_names
import 'dart:convert';
import 'package:Nkipay/pages/homeSreens/current_user_details.dart';
import 'package:Nkipay/pages/homeSreens/pay_recharge/payrecharge.dart';
import 'package:Nkipay/pages/homeSreens/plan_api_/check_user_op.dart';
import 'package:Nkipay/pages/homeSreens/plan_api_/plan_api_models.dart';
import 'package:Nkipay/pages/homeSreens/real_robo/realRobo.dart';
import 'package:Nkipay/pages/homeSreens/views/arecharge.dart';
import 'package:Nkipay/pages/homeSreens/views/recharge_models.dart';
import 'package:Nkipay/pages/homepage.dart';
import 'package:Nkipay/utils/showSnackBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

import '../gametopchartstabs.dart';

var phonenum = "";
int closing_balane_in_preapid = 0;

class phoneRecgargeForm extends StatefulWidget {
  const phoneRecgargeForm({
    Key? key,
  }) : super(key: key);

  @override
  State<phoneRecgargeForm> createState() => _phoneRecgargeFormState();
}

class _phoneRecgargeFormState extends State<phoneRecgargeForm> {
  final phonenumber = TextEditingController();
  final amount = TextEditingController(); //TextEditingController();
  void dispose() {
    phonenumber.dispose();
    amount.dispose();

    super.dispose();
  }

  String operatordropDownvalue = 'select one';
  var items = ["select one", 'Airtel', 'VI', 'Jio', 'BSNL'];
  int op_code = 0;

  //api check
  recharge_api_checK() {
    if (cur_api == "realrobo") {
      child:
      ElevatedButton(
        onPressed: () async {
          if (operatordropDownvalue == 'Airtel' || pay_recharge_oper == "AT") {
            op_code = 1;
            operatordropDownvalue = "Airtel";
          } else if (operatordropDownvalue == 'BSNL' ||
              pay_recharge_oper == "BS") {
            op_code = 2;
            operatordropDownvalue = "BSNL";
          } else if (operatordropDownvalue == 'Jio' ||
              pay_recharge_oper == "JO") {
            op_code = 3;
            operatordropDownvalue = "Jio";
          } else if (operatordropDownvalue == "VI" ||
              pay_recharge_oper == "VI") {
            op_code = 4;
            operatordropDownvalue = "VI";
          }
          // for get
          String entered_number = phonenumber.text;
          String entered_amount = amount.text;
          var response1 = await realRobo()
              //.get('v7/balance-check?')
              .get(
            'https://cros-anywhere.herokuapp.com/https://realrobo.in/api/recharge?api_token=1558656a-1772-46ea-b86a-70d640227f6a&number=$entered_number&amount=$entered_amount&req_id=856&operator_id=$op_code',
          )
              .catchError((err) {
            showSnackBar(context, err.toString());
          });

          if (response1 == null) {
            createTransactions(
                number: phonenumber.text, enteramount: amount.text);
            update_user(email: user.email!, enteramount: amount.text);
            create_user_Transactions(
                number: phonenumber.text, enteramount: amount.text);
            showSnackBar(context, 'fail');
          } else if (response1 != null) {
            createTransactions_for_fail(
                number: phonenumber.text, enteramount: amount.text);
            update_user(email: user.email!, enteramount: amount.text);
            create_user_Transactions_fail(
                number: phonenumber.text, enteramount: amount.text);
            showSnackBar(context,
                "message: " + realRobo_msg + " " + "status: " + realRobo_txid);
            showSnackBar(context, 'successful');
          }
        },
        style:
            ElevatedButton.styleFrom(primary: kPrimaryLightColor, elevation: 0),
        child: Text(
          "pay via realrobo".toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
      );
    } else if (cur_api == 'arecharge') {
      child:
      ElevatedButton(
        onPressed: () async {
          if (operatordropDownvalue == 'Airtel' || pay_recharge_oper == "AT") {
            op_code = 1;
            operatordropDownvalue = "Airtel";
          } else if (operatordropDownvalue == 'BSNL' ||
              pay_recharge_oper == "BS") {
            op_code = 2;
            operatordropDownvalue = "BSNL";
          } else if (operatordropDownvalue == 'Jio' ||
              pay_recharge_oper == "JO") {
            op_code = 3;
            operatordropDownvalue = "Jio";
          } else if (operatordropDownvalue == "VI" ||
              pay_recharge_oper == "VI") {
            op_code = 4;
            operatordropDownvalue = "VI";
          }
          // for get
          String entered_number = phonenumber.text;
          String entered_amount = amount.text;
          var response1 = await realRobo()
              //.get('v7/balance-check?')
              .get(
            'https://cros-anywhere.herokuapp.com/http://arecharge.in/api/recharge.php?token=#token&mobile=#mobile&amount=#amount&opid=#opid&urid=#urid&stv=#stv&cirleId=#circleId&userId=#userId',
          )
              .catchError((err) {
            showSnackBar(context, err.toString());
          });

          if (response1 == null) {
            createTransactions(
                number: phonenumber.text, enteramount: amount.text);
            update_user(email: user.email!, enteramount: amount.text);
            create_user_Transactions(
                number: phonenumber.text, enteramount: amount.text);
            showSnackBar(context, 'fail');
          } else if (response1 != null) {
            createTransactions_for_fail(
                number: phonenumber.text, enteramount: amount.text);
            update_user(email: user.email!, enteramount: amount.text);
            create_user_Transactions_fail(
                number: phonenumber.text, enteramount: amount.text);
            showSnackBar(context,
                "message: " + realRobo_msg + " " + "status: " + realRobo_txid);
            showSnackBar(context, 'successful');
          }
        },
        style:
            ElevatedButton.styleFrom(primary: kPrimaryLightColor, elevation: 0),
        child: Text(
          "pay via arechrage".toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
      );
    }
  }

  //creating transaction for success case
  Future create_user_Transactions(
      {required String number, required String enteramount}) async {
    final userTrans = FirebaseFirestore.instance
        .collection(user.email! + "Transaction_Histroy")
        .doc();
    final uid = userTrans.id;
    final json = {
      'user_email': user.email!,
      'phone_number': number,
      'amount': double.parse(enteramount),
      'user had balance before transaction': cur_bal,
      'user had balance after this transaction':
          cur_bal - double.parse(enteramount) / 100 * 3.5,
      "api transaction id": realRobo_txid,
      'api ': cur_api,
      'operator': op_code,
      'status': realRobo_status,
      'pay_at': DateTime.now(),
      'user_role': role.toString(),
      'uid': uid
      //'account_created_by':
    };
    await userTrans.set(json);
  }

  //update user
  Future update_user(
      {required String email, required String enteramount}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(email);
    final json = {
      "current_Balance": cur_bal - double.parse(enteramount) / 100 * 3.5,
    };
    await docUser.update(json);
  }

  //creating phone recharge transactions history..
  Future createTransactions(
      {required String number, required String enteramount}) async {
    final docuser =
        FirebaseFirestore.instance.collection("Transaction_Histroy").doc();
    final uid = docuser.id;
    final json = {
      'user_email': user.email!,
      'phone_number': number,
      'amount': double.parse(enteramount),
      'user had balance before transaction': cur_bal,
      'user had balance after this transaction':
          cur_bal - double.parse(enteramount) / 100 * 3.5,
      'pay_at': DateTime.now(),
      'user_role': role.toString(),
      'operator': op_code,
      'uid': uid,
      "api transaction id": realRobo_txid,
      'api ': cur_api,
      'status': realRobo_status,
      //'account_created_by':
    };
    await docuser.set(json);
  }

  //creating transaction history for fail case for user database
  Future createTransactions_for_fail(
      {required String number, required String enteramount}) async {
    final docuser =
        FirebaseFirestore.instance.collection("Transaction_Histroy").doc();
    final uid = docuser.id;
    final json = {
      'user_email': user.email!,
      'phone_number': number,
      'amount': double.parse(enteramount),
      'user had balance before transaction': cur_bal,
      'user had balance after this transaction':
          cur_bal - double.parse(enteramount) / 100 * 3.5,
      'pay_at': DateTime.now(),
      'user_role': role.toString(),
      'operator': op_code,
      'uid': uid,
      "api transaction id": realRobo_txid,
      'api ': cur_api,
      'status': realRobo_status,
      //'account_created_by':
    };
    await docuser.set(json);
  }

  //creating transaction history for fail for overall datebase
  Future create_user_Transactions_fail(
      {required String number, required String enteramount}) async {
    final userTrans = FirebaseFirestore.instance
        .collection(user.email! + "Transaction_Histroy")
        .doc();
    final uid = userTrans.id;
    final json = {
      'user_email': user.email!,
      'phone_number': number,
      'amount': double.parse(enteramount),
      'user had balance before transaction': cur_bal,
      'user had balance after this transaction':
          cur_bal - double.parse(enteramount) / 100 * 3.5,
      "api transaction id": realRobo_txid,
      'api ': cur_api,
      'operator': op_code,
      'status': realRobo_status,
      'pay_at': DateTime.now(),
      'user_role': role.toString(),
      'uid': uid
    };
    await userTrans.set(json);
  }

  // Stream<List<User>> ListData() => FirebaseFirestore.instance
  //     .collection('Transaction_Histroy')
  //     .where('user_email', isEqualTo: user.email)
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Form(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: userdetail1(),
              ),
              TextFormField(
                controller: phonenumber,
                keyboardType: TextInputType.text, //number
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Enter phone number",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.phone_iphone_rounded),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  controller: amount,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "Enter amount",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.monetization_on_rounded),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: DropdownButton(
                  value: operatordropDownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      operatordropDownvalue = newValue!;
                    });
                  },
                ),
              ),
              // //dropdown value
              // Text(operatordropDownvalue),
              //working api for op check
              //const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: ElevatedButton(
                  onPressed: () async {
                    // for get
                    var response1 = await pay_recharge()
                        //.get('v7/balance-check?')
                        .get(
                      'https://cros-anywhere.herokuapp.com/https://mobilerechargenow.com/api/mobileinfo.php?username=G133175852&apikey=1441591637&format=json&mobile=' +
                          phonenumber.text,
                    )
                        .catchError((err) {
                      showSnackBar(context, err.toString());
                    });
                    if (operatordropDownvalue == 'Airtel' ||
                        pay_recharge_oper == "AT") {
                      //op_code = 1;
                      operatordropDownvalue = "Airtel";
                    } else if (operatordropDownvalue == 'BSNL' ||
                        pay_recharge_oper == "BS") {
                      //op_code = 2;
                      operatordropDownvalue = "BSNL";
                    } else if (operatordropDownvalue == 'Jio' ||
                        pay_recharge_oper == "JO") {
                      //op_code = 3;
                      operatordropDownvalue = "Jio";
                    } else if (operatordropDownvalue == "VI" ||
                        pay_recharge_oper == "VI") {
                      //op_code = 4;
                      operatordropDownvalue = "VI";
                    }
                    if (response1 == null) {
                      showSnackBar(context, 'fail');
                    } else if (response1 != null) {
                      showSnackBar(
                          context,
                          "message: " +
                              pay_recharge_msg +
                              " " +
                              "status: " +
                              pay_recharge_status);
                      showSnackBar(context, 'successful');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryLightColor, elevation: 0),
                  child: Text(
                    "Get user info".toUpperCase(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              ////////////
              //workin api
              //const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                //child: recharge_api_checK(),
                child: ElevatedButton(
                  onPressed: () async {
                    if (operatordropDownvalue == 'Airtel' ||
                        pay_recharge_oper == "AT") {
                      op_code = 1;
                      operatordropDownvalue = "Airtel";
                    } else if (operatordropDownvalue == 'BSNL' ||
                        pay_recharge_oper == "BS") {
                      op_code = 2;
                      operatordropDownvalue = "BSNL";
                    } else if (operatordropDownvalue == 'Jio' ||
                        pay_recharge_oper == "JO") {
                      op_code = 3;
                      operatordropDownvalue = "Jio";
                    } else if (operatordropDownvalue == "VI" ||
                        pay_recharge_oper == "VI") {
                      op_code = 4;
                      operatordropDownvalue = "VI";
                    }
                    // for get
                    String entered_number = phonenumber.text;
                    String entered_amount = amount.text;
                    var response1 = await realRobo()
                        //.get('v7/balance-check?')
                        .get(
                      'https://cros-anywhere.herokuapp.com/https://realrobo.in/api/recharge?api_token=1558656a-1772-46ea-b86a-70d640227f6a&number=$entered_number&amount=$entered_amount&req_id=856&operator_id=$op_code',
                    )
                        .catchError((err) {
                      showSnackBar(context, err.toString());
                    });

                    if (response1 == null) {
                      createTransactions(
                          number: phonenumber.text, enteramount: amount.text);
                      update_user(email: user.email!, enteramount: amount.text);
                      create_user_Transactions(
                          number: phonenumber.text, enteramount: amount.text);
                      showSnackBar(context, 'fail');
                    } else if (response1 != null) {
                      createTransactions_for_fail(
                          number: phonenumber.text, enteramount: amount.text);
                      update_user(email: user.email!, enteramount: amount.text);
                      create_user_Transactions_fail(
                          number: phonenumber.text, enteramount: amount.text);
                      showSnackBar(
                          context,
                          "message: " +
                              realRobo_msg +
                              " " +
                              "status: " +
                              realRobo_txid);
                      showSnackBar(context, 'successful');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryLightColor, elevation: 0),
                  child: Text(
                    "pay via realrobo".toUpperCase(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       showDialog(
              //           context: context,
              //           builder: (context) => Dialog(
              //                 child: GameTopChartsTabs(0xff3f51b5),
              //               ));
              //     },
              //     style: ElevatedButton.styleFrom(
              //         primary: kPrimaryLightColor, elevation: 0),
              //     child: Text(
              //       "User Status".toUpperCase(),
              //       style: TextStyle(color: Colors.black),
              //     ),
              //   ),
              // ),

              // for check plan
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       showDialog(
              //           context: context,
              //           builder: (context) => Dialog(
              //                 child: GameTopChartsTabs(0xff3f51b5),
              //               ));
              //     },
              //     style: ElevatedButton.styleFrom(
              //         primary: kPrimaryLightColor, elevation: 0),
              //     child: Text(
              //       "check Plan".toUpperCase(),
              //       style: TextStyle(color: Colors.black),
              //     ),
              //   ),
              // ),
              //const SizedBox(height: defaultPadding / 2),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: ElevatedButton(
                  onPressed: () async {
                    // createTransactions(
                    //     number: phonenumber.text, enteramount: amount.text);
                    // create_user_Transactions(
                    //     number: phonenumber.text, enteramount: amount.text);

                    // //working api for check user plan
                    // var token = 'OT9sCg2FAS2VC4x';
                    // final num_result = phonenumber.text;
                    // // final num_res = planApiModelToJson(num);
                    // var response = await arecharge1()
                    //     //.get('v7/balance-check?')
                    //     .get(
                    //         'https://cros-anywhere.herokuapp.com/https://planapi.in/api/Mobile/OperatorFetchNew?ApiUserID=3557&ApiPassword=Neela@1988&Mobileno=$num_result')
                    //     .catchError((err) {
                    //   showSnackBar(context, err.toString());
                    // });
                    // if (response == null) {
                    //   showSnackBar(context, 'fail');
                    // } else if (response != null) {
                    //   showSnackBar(context,
                    //       'success' + plan_api_Operator + " " + plan_api_number);
                    // } //////////////////////

                    //
                    // var Client = http.Client();
                    // var token = 'OT9sCg2FAS2VC4x';
                    // var url = Uri.parse(
                    //     'http://arecharge.in/api/lapubal.php?token=' + token);
                    // if (response.statusCode == 200) {
                    //   showSnackBar(context, 'successful');

                    //   return debugPrint('success');
                    // } else if (response.statusCode == 400) {
                    //   showSnackBar(context, 'fail bad req');
                    // } else {
                    //   debugPrint('success');
                    //   showSnackBar(context, 'successful');
                    // }

                    //working api arecharge balance api
                    // var token = 'OT9sCg2FAS2VC4x';
                    // var response = await arecharge1()
                    //     //.get('v7/balance-check?')
                    //     .get(
                    //         'https://cros-anywhere.herokuapp.com/http://arecharge.in/api/lapubal.php?token=$token')
                    //     .catchError((err) {
                    //   showSnackBar(context, err.toString());
                    // });
                    // if (response == null) {
                    //   showSnackBar(context, 'fail');
                    // } else if (response != null) {
                    //   showSnackBar(context, 'successful');
                    // }///////////////////////
                  },
                  child: Text("Pay".toUpperCase()),
                ),
              ),
              // const SizedBox(
              //   height: 40,
              // ),

              // StreamBuilder<List<UserModel>>(
              //     stream: helper.read(),
              //     builder: (context, snapshot) {
              //       return Expanded(
              //         child: ListView.builder(itemBuilder: (context, index) {
              //           return Container(
              //             margin: EdgeInsets.symmetric(vertical: 5),
              //             child: ListTile(
              //               leading: Container(
              //                 width: 40,
              //                 height: 40,
              //                 decoration: const BoxDecoration(
              //                   color: Colors.purple,
              //                   shape: BoxShape.circle,
              //                 ),
              //               ),
              //             ),
              //           );
              //         }),
              //       );
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget builduser_payments(User user_payments) => ListTile(
//       leading: CircleAvatar(child: Text('${user_payments.amount}')),
//       title: Text(user_payments.user_email),
//       subtitle: Text(user_payments.phonenumber),
//     );

// class User {
//   final String phonenumber;
//   final String amount;
//   final String user_email;

//   User(
//       {required this.user_email,
//       required this.phonenumber,
//       required this.amount});

//   Map<String, dynamic> toJson() =>
//       {'user email': user_email, 'phone_number': phonenumber, 'amount': amount};

//   static User fromJson(Map<String, dynamic> json) => User(
//       user_email: json['user email'],
//       phonenumber: json['phone_number'],
//       amount: json['amount']
//       //date: json['date of paid'] as Timestamp.toDate(),
//       );
// }

//////////////////////////////////////////////////////////////////////
int current_balance_preapid = 0;
Widget userdetail1() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 10,
          child: Container(
            // width: MediaQuery.of(context).size.width / 4,
            // height: MediaQuery.of(context).size.height / 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              // padding: const EdgeInsets.all(18.0),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('email id', isEqualTo: user.email!)
                      .snapshots(),
                  //.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('something went wrong');
                    }
                    return ListView(
                        children: snapshot.data!.docs.map((document) {
                      // current_balance_preapid = document['current_Balance'];
                      // print(current_balance_preapid);
                      role = document['role'];
                      //api = document['current_api'];

                      return Column(
                        children: [
                          Center(
                            child: Container(
                              //color: kPrimaryColor,

                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.width,
                              //height: 100,
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(20),
                              //     gradient: const LinearGradient(colors: [
                              //       Colors.transparent,
                              //       kPrimaryLightColor
                              //       //Colors.white
                              //     ])),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding),
                                // padding: const EdgeInsets.all(defaultPadding),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Text(
                                    //   "Username : " + document['username'],
                                    //   style: GoogleFonts.josefinSans(
                                    //     fontWeight: FontWeight.bold,
                                    //     color:
                                    //         const Color.fromARGB(255, 247, 243, 243),
                                    //     // height: 1.3,
                                    //     fontSize: 14.0,
                                    //   ),
                                    // ),
                                    Text(
                                      "Closing Balance : " +
                                          document['current_Balance']
                                              .toString(),
                                      style: GoogleFonts.josefinSans(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        height: 1.3,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    // Text(
                                    //   "Email: " + document['email id'],
                                    //   style: GoogleFonts.josefinSans(
                                    //     fontWeight: FontWeight.bold,
                                    //     color:
                                    //         const Color.fromARGB(255, 244, 243, 243),
                                    //     height: 1.3,
                                    //     fontSize: 16.0,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   "Role : " + document['role'].toString(),
                                    //   style: GoogleFonts.josefinSans(
                                    //     fontWeight: FontWeight.bold,
                                    //     color:
                                    //         const Color.fromARGB(255, 249, 248, 248),
                                    //     height: 1.3,
                                    //     fontSize: 16.0,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   "current_api : " + cur_api,
                                    //   style: GoogleFonts.josefinSans(
                                    //     fontWeight: FontWeight.bold,
                                    //     color:
                                    //         const Color.fromARGB(255, 249, 248, 248),
                                    //     height: 1.3,
                                    //     fontSize: 16.0,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList());
                  }),
            ),
          ),
        );
      });
}
