import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvmproject/Utils/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices.CheckAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash\n Screen',style: TextStyle(fontSize: 30,color: Colors.black),textAlign: TextAlign.center)),
    );
  }
}
