import 'package:Nkipay/Screens/Login/components/forgotpasswordform.dart';
import 'package:flutter/material.dart';

import '../../../components/background.dart';
import '../../../responsive.dart';
import '../../../utils/constants.dart';
import '../../Signup/components/sign_up_top_image.dart';

class forgotPassword extends StatelessWidget {
  const forgotPassword({Key? key}) : super(key: key);

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
                      child: forgotPasswordWidget(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    //SocalSignUp()
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
              child: forgotPasswordWidget(),
            ),
            Spacer(),
          ],
        ),
        //const SocalSignUp()
      ],
    );
  }
}
