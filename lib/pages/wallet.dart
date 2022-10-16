import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class wallet extends StatefulWidget {
  const wallet({Key? key}) : super(key: key);

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    int money = 200;
    String inr = '₹';
    String wallet = money.toString();
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 5),
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Colors.purple,
          child: Container(
            height: 10,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.indigo])),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(inr + wallet)]),
          ),
        ),
      ),
    ));
  }
}
