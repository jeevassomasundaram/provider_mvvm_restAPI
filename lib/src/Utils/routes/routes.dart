import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/src/View/login/login.dart';

import '../../View/dashbaord/home.dart';
import 'routes_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.dashabord:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Dashbaord());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No routes defined"),
                  ),
                ));
    }
  }
}
