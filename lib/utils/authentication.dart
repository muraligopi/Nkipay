// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;

// final GoogleSignIn googleSignIn = GoogleSignIn();

import 'dart:js';

import 'package:Nkipay/pages/homepage.dart';
import 'package:Nkipay/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart';

//final FirebaseAuth _auth = FirebaseAuth.instance;

class Authentication {
  final FirebaseAuth _auth;
  Authentication(this._auth);

  User get user => _auth.currentUser!;

  // STATE PERSISTENCE STREAM
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  //login
  // loginservice() {
  //   return StreamBuilder(
  //     stream: FirebaseAuth.instance.authStateChanges(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return HomePage();
  //       } else {
  //         return const LoginWidget();
  //       }
  //     },
  //   );
  // }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
        //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
        //print('The account already exists for that email.');
      } else {
        showSnackBar(context, e.message!);
      } // Displaying the usual firebase error message
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }

  //log in
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!user.emailVerified) {
        await sendEmailVerification(context);
        // restrict access to certain things using provider
        // transition to another page instead of home screen
      } else {
        showSnackBar(context, "Logged in Successfully....");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }
//   signUp(
//       {required String emailID,
//       required String password,
//       required BuildContext context}) async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: emailID, password: password);

//       //debugPrint("Logged in successfully!");
//     } on FirebaseAuthException catch (e) {
//       switch (e.code) {
//         case 'weak-password':
//           showSnackBar(context, 'The password provided is too weak.');
//           debugPrint('The password provided is too weak.');
//           break;
//         case 'email-already-in-use':
//           showSnackBar(context, 'The account already exists for that email.');

//           debugPrint('The account already exists for that email.');
//           break;
//         default:
//           showSnackBar(context, 'please enter Email and password');
//           debugPrint('Error in signup');
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

  // signOut() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     debugPrint("Logged out successfully!");
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

// String? uid;
// String? name;
// String? userEmail;
// String? imageUrl;

// /// For checking if the user is already signed into the
// /// app using Google Sign In
// Future getUser() async {
//   await Firebase.initializeApp();

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool authSignedIn = prefs.getBool('auth') ?? false;

//   final User? user = _auth.currentUser;

//   if (authSignedIn == true) {
//     if (user != null) {
//       uid = user.uid;
//       name = user.displayName;
//       userEmail = user.email;
//       imageUrl = user.photoURL;
//     }
//   }
// }

// /// For authenticating user using Google Sign In
// /// with Firebase Authentication API.
// ///
// /// Retrieves some general user related information
// /// from their Google account for ease of the login process
// Future<User?> signInWithGoogle() async {
//   await Firebase.initializeApp();

//   User? user;

//   if (kIsWeb) {
//     GoogleAuthProvider authProvider = GoogleAuthProvider();

//     try {
//       final UserCredential userCredential =
//           await _auth.signInWithPopup(authProvider);

//       user = userCredential.user;
//     } catch (e) {
//       print(e);
//     }
//   } else {
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signIn();

//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       try {
//         final UserCredential userCredential =
//             await _auth.signInWithCredential(credential);

//         user = userCredential.user;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           print('The account already exists with a different credential.');
//         } else if (e.code == 'invalid-credential') {
//           print('Error occurred while accessing credentials. Try again.');
//         }
//       } catch (e) {
//         print(e);
//       }
//     }
//   }

//   if (user != null) {
//     uid = user.uid;
//     name = user.displayName;
//     userEmail = user.email;
//     imageUrl = user.photoURL;

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('auth', true);
//   }

//   return user;
// }

// Future<User?> registerWithEmailPassword(String email, String password) async {
//   await Firebase.initializeApp();
//   User? user;

//   try {
//     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     user = userCredential.user;

//     if (user != null) {
//       uid = user.uid;
//       userEmail = user.email;
//     }
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       print('The account already exists for that email.');
//     }
//   } catch (e) {
//     print(e);
//   }

//   return user;
// }

// Future<User?> signInWithEmailPassword(String email, String password) async {
//   await Firebase.initializeApp();
//   User? user;

//   try {
//     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     user = userCredential.user;

//     if (user != null) {
//       uid = user.uid;
//       userEmail = user.email;

//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('auth', true);
//     }
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided.');
//     }
//   }

//   return user;
// }

// Future<String> signOut() async {
//   await _auth.signOut();

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool('auth', false);

//   uid = null;
//   userEmail = null;

//   return 'User signed out';
// }

// /// For signing out of their Google account
// void signOutGoogle() async {
//   await googleSignIn.signOut();
//   await _auth.signOut();

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool('auth', false);

//   uid = null;
//   name = null;
//   userEmail = null;
//   imageUrl = null;

//   print("User signed out of Google account");
// }

}
