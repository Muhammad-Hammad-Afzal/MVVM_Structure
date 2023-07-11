import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvvmproject/Utils/Routs/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices{

  void CheckAuthentication(BuildContext context)async{
    SharedPreferences sp =await SharedPreferences.getInstance();

    //here we get the token that we set in shared prsference in Auth_View_Model Screen
    String? token = sp.getString('token');

    //here we check conditions
    if(token == null || token.isEmpty){
      Timer(Duration(seconds: 2), () { Navigator.pushNamed(context, RoutesName.Login_Screen);});
    }
      else{
        Timer(Duration(seconds: 2), () { Navigator.pushNamed(context, RoutesName.Home_Screen);});
      }
    }
  }