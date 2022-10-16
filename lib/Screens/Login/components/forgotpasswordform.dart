import 'package:Nkipay/utils/showSnackBar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:email_validator/email_validator.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../utils/constants.dart';
import '../../Login/login_screen.dart';

class forgotPasswordWidget extends StatefulWidget {
  const forgotPasswordWidget({Key? key}) : super(key: key);

  @override
  State<forgotPasswordWidget> createState() => forgotPasswordForm();
}

class forgotPasswordForm extends State<forgotPasswordWidget> {
  final emailid = TextEditingController();

  void dispose() {
    emailid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: emailid,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            //onSaved: (email) {},
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (emailid) =>
                emailid != null && !EmailValidator.validate(emailid)
                    ? "Enter a valid email id"
                    : null,
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          //   child: TextFormField(
          //     textInputAction: TextInputAction.done,
          //     obscureText: true,
          //     cursorColor: kPrimaryColor,
          //     decoration: InputDecoration(
          //       hintText: "Enter OTP",
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.drive_file_rename_outline_sharp),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: verifyEmail,
            child: Text("Reset Password".toUpperCase()),
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

  Future verifyEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailid.text.trim());
      showSnackBar(context, "Reset Password Email Sent");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      //Navigator.of(context).pop();
    }
  }
}
