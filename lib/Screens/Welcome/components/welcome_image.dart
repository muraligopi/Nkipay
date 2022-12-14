import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var height1 = MediaQuery.of(context).size.height / 8;
    // var width1 = MediaQuery.of(context).size.width / 6;
    return Column(
      children: [
        const Text(
          "WELCOME TO NKipay",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Row(
          children: <Widget>[
            const Spacer(),
            Flexible(
              flex: 8,
              fit: FlexFit.loose,
              child: Lottie.asset("assets/chat.json"),
            ),
            // SizedBox(
            //   child: Container(
            //     child: Lottie.asset("assets/chat.json"),
            //   ),
            // ),
            const Spacer(),
            // Flexible(
            //     flex: 8,
            //     fit: FlexFit.tight,
            //     //child: Lottie.asset("assets/lets-chat.json")),
            //     child: SvgPicture.asset("assets/icons/signup.svg")),
            //const Spacer(),
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
          //     child: Lottie.asset("assets/chat.json"),
          //     // child: SvgPicture.asset(
          //     //   "assets/icons/chat.svg",
          //     // ),
          //   ),
          //   const Spacer(),
          // ],
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
