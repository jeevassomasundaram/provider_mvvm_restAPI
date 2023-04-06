import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/src/Data/local%20data/prefrence.dart';
import 'package:provider_with_mvvm/src/View/dashbaord/home.dart';
import 'package:provider_with_mvvm/src/View/login/login.dart';

import 'src/Data/Network/network_api_services.dart';
import 'src/Data/Network/network_chnage.dart';
import 'src/Utils/providers_list/providers_list.dart';
import 'src/Utils/routes/routes.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<bool> userSessionAvilabeOrNot =
      ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    checkUSerSession();
  }

  @override
  void dispose() {
    super.dispose();
    userSessionAvilabeOrNot.dispose();
  }

  checkUSerSession() async {
    var token = await Pref.getToken();
    if (token.isNotEmpty) {
      if (kDebugMode) {
        print("token is $token");
      }
      userSessionAvilabeOrNot.value = true;
    } else {
      userSessionAvilabeOrNot.value = false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NetworkChange(
        child: MultiProvider(
      providers: ProvidersList.providerList,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter provider ',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Routes.generateRoute,
          home: getInitialRoute()),
    ));
  }

  getInitialRoute() {
    return ValueListenableBuilder(
      valueListenable: userSessionAvilabeOrNot,
      builder: (context, value, child) {
        return (userSessionAvilabeOrNot.value)
            ? const Dashbaord()
            : const LoginScreen();
      },
    );
  }
}
