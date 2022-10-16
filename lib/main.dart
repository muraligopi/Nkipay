// import 'package:Nkipay/pages/home/home.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:Nkipay/provider/theme.dart';
import 'package:Nkipay/routes/routes.dart';

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAmwF6zL1cLIvB61PNJCj3_rUOucEHdur0",
    appId: "1:412224487672:web:e87196d1eff340593cbb0d",
    messagingSenderId: "412224487672",
    projectId: "mineral-order-264306",
  ));
  configureApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        //Authentication().loginservice();
        return ThemeProvider(
          initTheme: ref.watch(themeProvider).isDarkMode
              ? MyThemes.darkTheme
              : MyThemes.lightTheme,
          child: MaterialApp(
            title: "Welcome to NKipay",
            debugShowCheckedModeBanner: false,
            themeMode: ref.watch(themeProvider).themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            //initialRoute: Routes.initial,
            onGenerateRoute: RouterGenerator.generateRoute,
          ),
        );
      },
    );
  }
  // Widget build(BuildContext context) => Scaffold(
  //         body: StreamBuilder<User?>(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Consumer(
  //             builder: (context, ref, _) {
  //               //Authentication().loginservice();
  //               return ThemeProvider(
  //                 initTheme: ref.watch(themeProvider).isDarkMode
  //                     ? MyThemes.darkTheme
  //                     : MyThemes.lightTheme,
  //                 child: MaterialApp(
  //                   title: "Welcome to NKipay",
  //                   debugShowCheckedModeBanner: false,
  //                   themeMode: ref.watch(themeProvider).themeMode,
  //                   theme: MyThemes.lightTheme,
  //                   darkTheme: MyThemes.darkTheme,
  //                   initialRoute: Routes.initial,
  //                   onGenerateRoute: RouterGenerator.generateRoute,
  //                 ),
  //               );
  //             },
  //           );
  //         } else {
  //           return const LoginWidget();
  //         }
  //       },
  //     ));
}

// Widget build(BuildContext context) {
// // return Consumer(
// //       builder: (context, ref, _) {
// //         //Authentication().loginservice();
// //         return ThemeProvider(
// //           initTheme: ref.watch(themeProvider).isDarkMode
// //               ? MyThemes.darkTheme
// //               : MyThemes.lightTheme,
// //           child: MaterialApp(
// //             title: "Welcome to NKipay",
// //             debugShowCheckedModeBanner: false,
// //             themeMode: ref.watch(themeProvider).themeMode,
// //             theme: MyThemes.lightTheme,
// //             darkTheme: MyThemes.darkTheme,
// //             //initialRoute: Routes.initial,
// //             onGenerateRoute: RouterGenerator.generateRoute,
// //           ),
// //         );
// //       },
// //     );
// }
