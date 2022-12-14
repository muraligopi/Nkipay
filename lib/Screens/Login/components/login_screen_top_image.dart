import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:Nkipay/utils/constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "LOGIN TO NKipay",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        //SizedBox(height: defaultPadding * 2),
        Row(
          children: <Widget>[
            const Spacer(),
            Flexible(
                flex: 8,
                fit: FlexFit.loose,
                child: Lottie.asset("assets/lets-chat.json")),
            const Spacer(),
            // Expanded(
            //   flex: 2,

            //   child: Lottie.asset(
            //       "assets/signup.json"), //https://youtu.be/lq81prXvV6M
            //   //child: SvgPicture.asset("assets/icons/signup.svg"),
            // ),
          ],
          // children: [
          //   const Spacer(),
          //   Expanded(
          //     flex: 3,
          //     child: Lottie.asset("assets/lets-chat.json"),
          //   ),
          //   const Spacer(),
          // ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
