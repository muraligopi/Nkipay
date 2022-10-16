import 'package:Nkipay/Screens/Signup/otp.dart/otp_form.dart';
import 'package:Nkipay/Screens/Signup/signup_otp.dart';
import 'package:Nkipay/utils/authentication.dart';
import 'package:Nkipay/utils/showSnackBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../pages/homepage.dart';
import '../../../utils/constants.dart';
import '../../Login/login_screen.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => signForm();
}

class signForm extends State<SignUpWidget> {
  //final GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  // late String _email;
  // late String _password;
  // late String _conformPassword;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  final emailid = TextEditingController();
  final password = TextEditingController();
  final role = TextEditingController();
  // final auth = FirebaseAuth.instance;

  void dispose() {
    super.dispose();
    emailid.dispose();
    password.dispose();
  }

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  Future signup() async {
    if (formKey.currentState!.validate()) {
      await Authentication(FirebaseAuth.instance).signUpWithEmail(
          email: emailid.text, password: password.text, context: context);
      //addUser();
      createUser(email: emailid.text);
      showSnackBar(context,
          "Congratulations, your account has been successfully created....");
    }
  }

  // Future<void> addUser() {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //   return users
  //       .add({
  //         "uid": user.uid,
  //         "email": emailid.text,
  //         "role": "SA",
  //         "current_Balance": 0,
  //         "recharge_access": "true"
  //       })
  //       .then((value) => showSnackBar(context, "user Added"))
  //       .catchError(
  //           (error) => showSnackBar(context, "Failed to add user: $error"));
  // }

  Future createUser({required String email}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(email);

    final json = {
      'email id': email,
      "role": dropdownvalue,
      "current_Balance": 0.toInt(),
      "recharge_access": "true",
      "created by": user.email!,
      "created at": DateTime.now()
    };
    await docUser.set(json);
  }

  String dropdownvalue = 'User';

  // List of items in our dropdown menu
  var items = [
    'User',
    'Retailer',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailid,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (emailid) {
              if (emailid != null && !EmailValidator.validate(emailid)) {
                return "Enter a valid email id";
                // : null,
              } else if (emailid == null || emailid.isEmpty) {
                return "Enter your email id";
              }
            },

            // onChanged: (value) {
            //   setState(() {
            //     _email = value.trim();
            //   });
            // },
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              controller: password,
              obscureText: true,
              cursorColor: kPrimaryColor,
              //autovalidateMode: AutovalidateMode.onUserInteraction,

              validator: (password) {
                if (password!.isEmpty) {
                  return "Please enter password";
                  //showSnackBar(context, "Please enter password");
                } else {
                  //call function to check password
                  bool result = validatePassword(password);
                  if (result) {
                    // create account event
                    return null;
                  } else {
                    return " Password should contain Capital, small letter & Number & Special";
                    // showSnackBar(context,
                    //     " Password should contain Capital, small letter & Number & Special");
                  }
                }
              },

              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: DropdownButton(
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: signup,
            // () {
            //   signUp(String emailID, String password)
            //       .then((_) {
            //     Navigator.of(context).pushReplacement(
            //         MaterialPageRoute(builder: (context) => Signup_otp()));
            //   });
            //   //   context,
            //   //   MaterialPageRoute(
            //   //     builder: (context) {
            //   //       return Signup_otp();
            //   //     },
            //   //   ),
            //   // );
            // },
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
                    return const LoginScreen();
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
