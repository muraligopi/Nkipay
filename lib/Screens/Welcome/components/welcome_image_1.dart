import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class WelcomeImage1 extends StatelessWidget {
  const WelcomeImage1({
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
              flex: 2,
              fit: FlexFit.loose,
              child: SvgPicture.asset(
                "assets/icons/chat.svg",
              ),
            ),
            const Spacer(),
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
