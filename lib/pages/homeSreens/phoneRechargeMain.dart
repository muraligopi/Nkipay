import 'package:Nkipay/pages/homeSreens/current_user_trans.dart';
import 'package:Nkipay/pages/homeSreens/phoneRecharge_form.dart';
import 'package:flutter/material.dart';

import '../../Screens/Signup/components/sign_up_top_image.dart';
import '../../components/background.dart';
import '../../responsive.dart';

class phoneRecgargeMain extends StatelessWidget {
  const phoneRecgargeMain({Key? key}) : super(key: key);

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
                      child: phoneRecgargeForm(),
                    ),
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
              child: phoneRecgargeForm(),
            ),
            Spacer(),
          ],
        ),
        //const SocalSignUp()
      ],
    );
  }
}
