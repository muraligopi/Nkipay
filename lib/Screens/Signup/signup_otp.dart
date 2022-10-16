import 'package:flutter/material.dart';

import '../../components/background.dart';
import '../../responsive.dart';
import '../../utils/constants.dart';
import 'components/sign_up_top_image.dart';

import 'components/signup_form.dart';
import 'components/socal_sign_up.dart';
import 'otp.dart/otp_form.dart';

class Signup_otp extends StatelessWidget {
  const Signup_otp({Key? key}) : super(key: key);

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
                  children: const [
                    SizedBox(
                      width: 450,
                      child: otp_form(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    SocalSignUp()
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpWidget(),
            ),
            Spacer(),
          ],
        ),
        const SocalSignUp()
      ],
    );
  }
}
