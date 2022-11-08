// ignore: file_names

import 'package:Nkipay/pages/homeSreens/current_user_details.dart';
import 'package:Nkipay/pages/homeSreens/views/arecharge.dart';
import 'package:Nkipay/pages/homepage.dart';
import 'package:Nkipay/utils/showSnackBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

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
          double.parse(enteramount) / 100 * 3.5,
      'pay_at': DateTime.now(),
      'user_role': role.toString(),
      'uid': uid
      //'account_created_by':
    };
    await userTrans.set(json);
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
          double.parse(enteramount) / 100 * 3.5,
      'pay_at': DateTime.now(),
      'user_role': role.toString(),
      'uid': uid,
      'status': 'fail',
      //'account_created_by':
    };
    await docuser.set(json);
  }

  // Stream<List<User>> ListData() => FirebaseFirestore.instance
  //     .collection('Transaction_Histroy')
  //     .where('user_email', isEqualTo: user.email)
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: Column(
          children: [
            TextFormField(
              controller: phonenumber,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Enter customer phone number",
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
            Row(
              children: [],
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton(
              onPressed: () async {
                // createTransactions(
                //     number: phonenumber.text, enteramount: amount.text);
                // create_user_Transactions(
                //     number: phonenumber.text, enteramount: amount.text);

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

                var token = 'OT9sCg2FAS2VC4x';
                var response = await arecharge1()
                    //.get('v7/balance-check?')
                    .get(
                  'https://cros-anywhere.herokuapp.com/http://arecharge.in/api/lapubal.php?token=',
                )
                    .catchError((err) {
                  showSnackBar(context, err.toString());
                });
                if (response == null) {
                  showSnackBar(context, 'fail');
                } else if (response != null) {
                  showSnackBar(context, 'successful');
                }
              },
              child: Text("Pay".toUpperCase()),
            ),
            const SizedBox(
              height: 40,
            ),

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
