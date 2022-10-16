import 'package:Nkipay/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import '../Screens/Welcome/welcome_screen.dart';
import '../pages/home/home.dart';
import '../utils/constants.dart';

class Routes {
  static const String initial = "/";
  static const String demos = "/home_main";
  static const String homeScreen = "/homeScreen";
}

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return _GeneratePageRoute(
            widget: const Home(), routeName: settings.name);
      case Routes.demos:
        return _GeneratePageRoute(widget: HomePage(), routeName: settings.name);
      case Routes.homeScreen:
        return _GeneratePageRoute(widget: HomePage(), routeName: settings.name);

      default:
        return _GeneratePageRoute(widget: HomePage(), routeName: settings.name);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget? widget;
  final String? routeName;
  _GeneratePageRoute({this.widget, this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget ?? Container();
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                  textDirection: TextDirection.rtl,
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: ResponsiveWrapper.builder(
                    ClampingScrollWrapper.builder(context, child),
                    defaultScale: true,
                    breakpoints: [
                      const ResponsiveBreakpoint.resize(450, name: MOBILE),
                      const ResponsiveBreakpoint.resize(800, name: TABLET),
                      const ResponsiveBreakpoint.resize(1000, name: TABLET),
                      const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                      const ResponsiveBreakpoint.resize(2460, name: "4K"),
                    ],
                    background: Container(
                      color: kBackgroundColor,
                    ),
                  ));
            });
}
