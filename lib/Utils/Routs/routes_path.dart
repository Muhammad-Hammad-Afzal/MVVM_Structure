import 'package:flutter/material.dart';
import 'package:mvvmproject/Utils/Routs/routes_name.dart';
import 'package:mvvmproject/View/Home_Screen.dart';
import 'package:mvvmproject/View/Login_Screen.dart';
import 'package:mvvmproject/View/splash_Screen.dart';

class RoutsPath{
   static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.Login_Screen:
        return MaterialPageRoute(builder: (BuildContext context) =>const LoginScreen());

      case RoutesName.Home_Screen:
        return MaterialPageRoute(builder: (BuildContext context) =>const HomeScreen());

      case RoutesName.Splash_Screen:
        return MaterialPageRoute(builder: (BuildContext context) =>const SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) =>const Scaffold(
          body: Center(child: Text('No Data Found')),
        ));
    }
  }
}