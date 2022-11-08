import 'package:Nkipay/pages/homeSreens/views/models.dart';
import 'package:Nkipay/pages/homepage.dart';
import 'package:flutter/material.dart';
import '../../../pages/homeSreens/views/arecharge.dart';
import '../../../utils/constants.dart';
import '../../../utils/showSnackBar.dart';
import '../../Login/login_screen.dart';
import '../../Signup/components/socal_sign_up.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryLightColor, elevation: 0),
          child: Text(
            "Sign Up".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: kPrimaryLightColor, elevation: 0),
          child: Text(
            "User Status".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
        ),

        //get
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            // for get
            var response1 = await arecharge1()
                //.get('v7/balance-check?')
                .get(
              'http://arecharge.in/api/lapubal.php?token=OT9sCg2FAS2VC4x',
            )
                .catchError((err) {
              showSnackBar(context, err.toString());
            });

            if (response1 == null) {
              showSnackBar(context, 'fail');
            } else if (response1 != null) {
              showSnackBar(context, 'successful');
            }
          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryLightColor, elevation: 0),
          child: Text(
            "get".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            //for post

            var apibody = ArechargeModel(
                mobile: "7871969868",
                amount: "1",
                opid: 1,
                urid: "0004",
                cirleId: 6,
                stv: "stv",
                token: "OT9sCg2FAS2VC4x",
                userId: "userId");

            var response = await arecharge1()
                //.get('v7/balance-check?')
                .post(
                    'https://cros-anywhere.herokuapp.com/http://arecharge.in/api/recharge.php?token=OT9sCg2FAS2VC4x&',
                    apibody)
                .catchError((err) {
              showSnackBar(context, err.toString());
            });

            if (response == null) {
              showSnackBar(context, 'fail');
            } else if (response != null) {
              showSnackBar(context, 'successful');
            }
          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryLightColor, elevation: 0),
          child: Text(
            "post".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        SocalSignUp(),
      ],
    );
  }
}
