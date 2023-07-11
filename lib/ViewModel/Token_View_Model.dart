import 'package:flutter/foundation.dart';
import 'package:mvvmproject/Model/Login_Api_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{


  // Future<bool> SaveUser(LoginApiModel loginApiModel)async{
  //   SharedPreferences sp =await SharedPreferences.getInstance();
  //   sp.setString('token', loginApiModel.token.toString());
  //   notifyListeners();
  //   return true;
  // }

  // Future<LoginApiModel> Gettoken()async{
  //   SharedPreferences sp =await SharedPreferences.getInstance();
  //   final String? token = sp.getString('token');
  //   return LoginApiModel(
  //     token: token.toString()
  //   );
  // }

  Future Gettoken()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return token;
  }

  Future<bool> RemoveUser()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    notifyListeners();
    return sp.clear();

  }

}