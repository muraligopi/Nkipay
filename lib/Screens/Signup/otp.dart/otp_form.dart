import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../utils/constants.dart';
import '../../Login/login_screen.dart';

class otp_form extends StatelessWidget {
  const otp_form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // TextFormField(
          //   keyboardType: TextInputType.emailAddress,
          //   textInputAction: TextInputAction.next,
          //   cursorColor: kPrimaryColor,
          //   onSaved: (email) {},
          //   decoration: InputDecoration(
          //     hintText: "Your email",
          //     prefixIcon: Padding(
          //       padding: const EdgeInsets.all(defaultPadding),
          //       child: Icon(Icons.person),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          //   child: TextFormField(
          //     textInputAction: TextInputAction.done,
          //     obscureText: true,
          //     cursorColor: kPrimaryColor,
          //     decoration: InputDecoration(
          //       hintText: "Your phone number",
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.phone_iphone_rounded),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Enter OTP",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.drive_file_rename_outline_sharp),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {},
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
