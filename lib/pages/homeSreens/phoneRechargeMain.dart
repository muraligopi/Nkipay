import 'package:Nkipay/pages/gametopchartstabs.dart';
import 'package:Nkipay/pages/homeSreens/current_user_details.dart';
import 'package:Nkipay/pages/homeSreens/current_user_trans.dart';
import 'package:Nkipay/pages/homeSreens/phoneRecharge_form.dart';
import 'package:Nkipay/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/Signup/components/sign_up_top_image.dart';
import '../../components/background.dart';
import '../../responsive.dart';
import '../../utils/constants.dart';

class phoneRecgargeMain extends StatelessWidget {
  const phoneRecgargeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileSignupScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: SignUpScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: phoneRecgargeForm(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Text("Hello from admin "),
          //Spacer(),
          Expanded(
            flex: 0,
            child: phoneRecgargeForm(),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
