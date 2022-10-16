import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "WELCOME TO NKipay",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Lottie.asset("assets/chat.json"),
              // child: SvgPicture.asset(
              //   "assets/icons/chat.svg",
              // ),
            ),
            Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
