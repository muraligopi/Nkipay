import 'package:Nkipay/pages/homeSreens/current_user_details.dart';
import 'package:Nkipay/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../Screens/Signup/signup_otp.dart';
import '../../utils/constants.dart';

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

  // int current_balance_form_db = 0;
  // get_amount() {
  //   StreamBuilder(
  //       stream: FirebaseFirestore.instance
  //           .collection('users')
  //           .where('user_email', isEqualTo: user.email!)
  //           .snapshots(),
  //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //         if (!snapshot.hasData) {
  //               return const Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //             } else if (snapshot.hasError) {
  //               return const Text('something went wrong');
  //             } return Text(snapshot.data!.docs.map((document) {
  //           current_balance_form_db = document['current_Balance'];));

  //         });
  //       }

  //creating phone recharge transactions history..
  Future createTransactions(
      {required String number, required String enteramount}) async {
    final docuser =
        FirebaseFirestore.instance.collection("Transaction_Histroy").doc();
    final userTrans = FirebaseFirestore.instance
        .collection(user.email! + "Transaction_Histroy")
        .doc();
    final json = {
      'user_email': user.email!,
      'phone_number': number,
      'amount': double.parse(enteramount),
      'user had balance before transaction': cur_bal,
      'user had balance after this transaction':
          double.parse(enteramount) / 100 * 3.5,
      'pay_at': DateTime.now(),
      'user_role': role.toString()
      //'account_created_by':
    };
    await docuser.set(json);
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
    return Form(
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

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              createTransactions(
                  number: phonenumber.text, enteramount: amount.text);
            },
            child: Text("Pay".toUpperCase()),
          ),
          // StreamBuilder<List<User>>(
          //   stream: ListData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       return Text('something went wrong');
          //     } else if (snapshot.hasData) {
          //       final user_payments = snapshot.data;
          //       return ListView(
          //         children: user_payments!.map(builduser_payments).toList(),
          //       );
          //     } else {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
        ],
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
