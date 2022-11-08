import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class SignUpScreenTopImage1 extends StatelessWidget {
  const SignUpScreenTopImage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign Up".toUpperCase(),
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(255, 14, 3, 3),
            // height: 1.3,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 2),
        Row(
          children: <Widget>[
            const Spacer(),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: SvgPicture.asset("assets/icons/signup.svg"),
            ),
            const Spacer(),
            // Expanded(
            //   flex: 2,

            //   child: Lottie.asset(
            //       "assets/signup.json"), //https://youtu.be/lq81prXvV6M
            //   //child: SvgPicture.asset("assets/icons/signup.svg"),
            // ),
          ],
        ),
        SizedBox(height: 2),
      ],
    );
  }
}
