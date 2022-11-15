import 'package:Nkipay/Screens/Login/components/forgotpassword.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';
import 'package:Nkipay/utils/constants.dart';
import '../../../pages/homepage.dart';
import '../../../utils/authentication.dart';
import '../../Signup/signup_screen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginForm();
}

class _LoginForm extends State<LoginWidget> {
  // late String _email;
  //late String _password;
  final emailid = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    emailid.dispose();
    password.dispose();

    super.dispose();
  }

  void loginUser() {
    Authentication(FirebaseAuth.instance).loginWithEmail(
      email: emailid.text,
      password: password.text,
      context: context,
    );
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (emailid) {
              if (emailid != null && !EmailValidator.validate(emailid)) {
                return "Enter a valid email id";
                // : null,
              } else if (emailid == null || emailid.isEmpty) {
                return "Enter your email id";
              }
              return null;
            },
            onSaved: (email) {},
            // onChanged: (value) {
            //   setState(() {
            //     _email = value.trim();
            //   });
            // },
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: password,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onChanged: (value) {},
              // setState(() {
              //   _password = value.trim();
              // });
              //},
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              // onPressed: () {
              //   Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(builder: (context) => HomePage()));
              // },
              onPressed: loginUser,
              // () {
              //   auth
              //       .signInWithEmailAndPassword(
              //           email: _email, password: _password)
              //       .then((_) {
              //     if (!auth.currentUser!.emailVerified) {
              //       Authentication(auth).sendEmailVerification(context);
              //     } else {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => admin_home()));
              //     }
              //   });
              // },
              //() {
              //},
              //() {
              //   // Navigator.push(
              //   //   context,
              //   //   MaterialPageRoute(
              //   //     builder: (context) {
              //   //       return const admin_home();
              //   //     },
              //   //   ),
              //   // );
              // },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          GestureDetector(
            child: const Text(
              "Forgot password?",
              style: TextStyle(color: kPrimaryColor),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const forgotPassword(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: emailid.text.trim(),
  //     password: password.text.trim(),
  //   );
  // }
}
