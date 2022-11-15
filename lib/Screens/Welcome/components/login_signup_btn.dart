import 'package:Nkipay/pages/gametopchartstabs.dart';
import 'package:Nkipay/pages/homeSreens/pay_recharge/payrecharge.dart';
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
        // showDialog(
        //                             context: context,
        //                             builder: (context) => Dialog(
        // const SizedBox(height: 16),
        // ElevatedButton(
        //   onPressed: () {
        //     showDialog(
        //         context: context,
        //         builder: (context) => Dialog(
        //               child: GameTopChartsTabs(0xff3f51b5),
        //             ));
        //   },
        //   style: ElevatedButton.styleFrom(
        //       primary: kPrimaryLightColor, elevation: 0),
        //   child: Text(
        //     "User Status".toUpperCase(),
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        // const SizedBox(height: 16),
        // ElevatedButton(
        //   onPressed: () async {
        //     // for get
        //     var response1 = await pay_recharge()
        //         //.get('v7/balance-check?')
        //         .get(
        //       'https://cros-anywhere.herokuapp.com/https://mobilerechargenow.com/api/mobileinfo.php?username=G133175852&apikey=1441591637&format=json&mobile=7871969868',
        //     )
        //         .catchError((err) {
        //       showSnackBar(context, err.toString());
        //     });

        //     if (response1 == null) {
        //       showSnackBar(context, 'fail');
        //     } else if (response1 != null) {
        //       showSnackBar(context, 'successful');
        //     }
        //   },
        //   style: ElevatedButton.styleFrom(
        //       primary: kPrimaryLightColor, elevation: 0),
        //   child: Text(
        //     "get".toUpperCase(),
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),

        ///103.25.44.82

        // working well get method for arecharge
        // const SizedBox(height: 16),
        // ElevatedButton(
        //   onPressed: () async {
        //     // for get
        //     var response1 = await arecharge1()
        //         //.get('v7/balance-check?')
        //         .get(
        //       'https://cros-anywhere.herokuapp.com/http://arecharge.in/api/lapubal.php?token=OT9sCg2FAS2VC4x',
        //     )
        //         .catchError((err) {
        //       showSnackBar(context, err.toString());
        //     });

        //     if (response1 == null) {
        //       showSnackBar(context, 'fail');
        //     } else if (response1 != null) {
        //       showSnackBar(context, 'successful');
        //     }
        //   },
        //   style: ElevatedButton.styleFrom(
        //       primary: kPrimaryLightColor, elevation: 0),
        //   child: Text(
        //     "get".toUpperCase(),
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        /////////////////////////////

        ///working pay recherge get method
        // const SizedBox(height: 16),
        // ElevatedButton(
        //   onPressed: () async {
        //     // for get
        //     var response1 = await pay_recharge()
        //         //.get('v7/balance-check?')
        //         .get(
        //       'https://cros-anywhere.herokuapp.com/https://mobilerechargenow.com/api/mobileinfo.php?username=G133175852&apikey=1441591637&format=json&mobile=7871969868',
        //     )
        //         .catchError((err) {
        //       showSnackBar(context, err.toString());
        //     });

        //     if (response1 == null) {
        //       showSnackBar(context, 'fail');
        //     } else if (response1 != null) {
        //       showSnackBar(context, 'successful');
        //     }
        //   },
        //   style: ElevatedButton.styleFrom(
        //       primary: kPrimaryLightColor, elevation: 0),
        //   child: Text(
        //     "get".toUpperCase(),
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        // const SizedBox(height: 16),
        // ElevatedButton(
        //   onPressed: () async {
        //     //for post

        //     var apibody = ArechargeModel(
        //       mobile: "7871969868",
        //       amount: "1",
        //       opid: "1",
        //       urid: "0005",
        //       cirleId: "6",
        //       stv: "1",
        //       token: "OT9sCg2FAS2VC4x",
        //       userId: "userId",
        //     );

        //     var response = await arecharge1()
        //         //.get('v7/balance-check?')

        //         .post(
        //       'https://cros-anywhere.herokuapp.com/http://arecharge.in/api/recharge.php?token=OT9sCg2FAS2VC4x&',
        //     )
        //         // .get(
        //         //     'https://cros-anywhere.herokuapp.com/http://arecharge.in/api/recharge.php?token=OT9sCg2FAS2VC4x&mobile=8111021366&amount=1&opid=3&urid=0006&stv=1&cirleId=6&userId=userId')
        //         .catchError((err) {
        //       showSnackBar(context, err.toString());
        //     });

        //     if (response == null) {
        //       showSnackBar(context, 'fail');
        //     } else if (response != null) {
        //       showSnackBar(context, 'successful');
        //     }
        //   },
        //   style: ElevatedButton.styleFrom(
        //       primary: kPrimaryLightColor, elevation: 0),
        //   child: Text(
        //     "post".toUpperCase(),
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        SizedBox(height: defaultPadding / 2),
        SocalSignUp(),
      ],
    );
  }
}
