import 'dart:async';

import 'package:bunny/routes/app_page.dart';
import 'package:bunny/services/prefs_service.dart';
import 'package:bunny/util/colors.dart';
import 'package:bunny/views/login/login_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    Future.wait([PrefService.isAuth(), Future.delayed(Duration(seconds: 3))])
        .then((value) => value[0]
            ? Navigator.of(context).pushReplacementNamed('/home')
            /* Get.offNamed(Routes.Home) */
            : Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => print("TEM INTERNET"));
        break;
      default:
        setState(() => print("N TEM INTERRR EM INTERNET"));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: azulClaro,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/logos/logosplash.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Rabbity",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          )),
        ),
      ),
    );
  }
}



/*@override
  void initState() {
    super.initState();

    Future.wait([PrefService.isAuth(), Future.delayed(Duration(seconds: 3))])
        .then((value) => value[0]
            ? Navigator.of(context).pushReplacementNamed('/home')
            /* Get.offNamed(Routes.Home) */
            : Navigator.of(context).pushReplacementNamed('/login'));

/* Get.offNamed(Routes.Login));
    Future.delayed(Duration(seconds: 3))
        .then((_) => Navigator.of(context).pushReplacementNamed('/login'));
  
  */
  */