import 'package:flutter/cupertino.dart';
import 'package:mvvmproject/Utils/Routs/routes_name.dart';
import 'package:mvvmproject/Utils/Utils.dart';
import 'package:mvvmproject/repository/Login_Repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier{
  final _authrepository = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(value){
    _loading = value;
    notifyListeners();
  }

  Future<void> LoginApi(dynamic data,BuildContext context)async{
    setLoading(true);
    _authrepository.loginApi(data).
    then((value)async {
      setLoading(false);

      //here we store token value in Sharedpraferance and in splash Service we get this token
      SharedPreferences sp =await SharedPreferences.getInstance();
      sp.setString('token', value.toString());
      print(value.toString());
      Navigator.pushNamed(context, RoutesName.Home_Screen);
    }).onError((error, stackTrace){
      setLoading(false);
      Utils().ShowSnackbar(context, error.toString());
    });
  }
}