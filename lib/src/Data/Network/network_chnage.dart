// ignore_for_file: must_be_immutable, must_call_super

import 'dart:async';
import 'package:flutter/material.dart';
import '../../Network connectivity/network.dart';
import '../../Resource/Loader/http_loader.dart';

class NetworkChange extends StatefulWidget {
  Widget child;
  NetworkChange({Key? key, required this.child}) : super(key: key);

  @override
  createState() => NetworkChangeState();
}

class NetworkChangeState extends State<NetworkChange> {
  bool timeOverHideTheWidget = false;
  bool startUpdatingLayoutAccordingToStatus = false;
  bool isAppLaunchesFirstTime = true;

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      Network(onChange: () {
        if (Network.status == NetworkState.CONNECTED) {
          timeOverHideTheWidget = false;
        }
        startUpdatingLayoutAccordingToStatus = true;
        setState(() {});
      });
    });

    Timer(const Duration(seconds: 5), () {
      isAppLaunchesFirstTime = false;
      if (Network.status != NetworkState.CONNECTED) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return HTTPLoader(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child: widget.child),
            if (Network.status == NetworkState.UNKNOWN ||
                Network.status == NetworkState.DISCONNECTED) ...[
              _networkNotAvailable()
            ] else ...[
              _networkAvailable()
            ]
          ],
        ),
      ),
    ));
  }

  Widget _networkAvailable() {
    if (startUpdatingLayoutAccordingToStatus == false ||
        isAppLaunchesFirstTime == true) {
      return Container();
    }

    if (timeOverHideTheWidget == false) {
      Timer(const Duration(seconds: 3), () {
        setState(() {
          timeOverHideTheWidget = true;
        });
      });
    } else {
      return Container();
    }

    return Container(
      width: double.maxFinite,
      height: 22,
      color: Colors.green,
      child: Center(
        child: Text(
          "Back online",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _networkNotAvailable() {
    if (isAppLaunchesFirstTime == true) {
      return Container();
    }

    return Container(
      width: double.maxFinite,
      height: 22,
      color: Colors.black,
      child: Center(
        child: Text(
          "No connection",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
