import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
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
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: Lottie.asset(
                  "assets/signup.json"), //https://youtu.be/lq81prXvV6M
              //child: SvgPicture.asset("assets/icons/signup.svg"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
