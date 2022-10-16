import 'package:Nkipay/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//getting transactions history of current user from FS and display as list...
class currentUserPayment extends StatefulWidget {
  const currentUserPayment({Key? key}) : super(key: key);

  @override
  State<currentUserPayment> createState() => _currentUserPaymentState();
}

Stream<List<User>> ListData() => FirebaseFirestore.instance
    .collection('Transaction_Histroy')
    .where('user_email', isEqualTo: user.email!)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

class _currentUserPaymentState extends State<currentUserPayment> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<List<User>>(
          stream: ListData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('something went wrong');
            } else if (snapshot.hasData) {
              final user_payments = snapshot.data;
              MainAxisAlignment.center;
              BorderRadius.all(Radius.circular(20));
              return ListView(
                children: user_payments!.map(builduser_payments).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
}

Widget builduser_payments(User user_payments) => ListTile(
      leading: CircleAvatar(child: Text('${user_payments.amount}')),
      title: Text(user_payments.user_email),
      subtitle: Text(user_payments.phonenumber),
    );

class User {
  final String phonenumber;
  final String amount;
  final String user_email;

  User({
    required this.user_email,
    required this.phonenumber,
    required this.amount,
    // required this.paid_data_time
  });

  Map<String, dynamic> toJson() =>
      {'user_email': user_email, 'phone_number': phonenumber, 'amount': amount};

  static User fromJson(Map<String, dynamic> json) => User(
      user_email: json['user_email'],
      phonenumber: json['phone_number'],
      amount: json['amount'].toString()
      // date: json['date of paid'] as Timestamp.toDate(),
      );
}
