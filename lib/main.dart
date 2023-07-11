import 'package:flutter/material.dart';
import 'package:mvvmproject/Utils/Routs/routes_name.dart';
import 'package:mvvmproject/ViewModel/Register_view_modal.dart';
import 'package:mvvmproject/ViewModel/Login_View_Model.dart';
import 'package:provider/provider.dart';
import 'Utils/Routs/routes_path.dart';
import 'package:device_preview/device_preview.dart';

import 'ViewModel/Token_View_Model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => AuthRegisterViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: RoutesName.Splash_Screen,
          onGenerateRoute: RoutsPath.generateRoute,
        ),
    );
  }
}
