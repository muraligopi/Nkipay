// import 'package:Nkipay/Screens/Login/components/login_form.dart';
// import 'package:Nkipay/Screens/Login/login_screen.dart';
// import 'package:Nkipay/Screens/Welcome/welcome_screen.dart';
// import 'package:Nkipay/pages/homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class loginController extends StatelessWidget {
//   const loginController({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return HomePage();
//           } else {
//             return const LoginScreen();
//           }
//         },
//       ),
//     );
//   }
// }
