import 'package:flutter/cupertino.dart';
import 'package:mvvmproject/Utils/Routs/routes_name.dart';
import 'package:mvvmproject/Utils/Utils.dart';
import 'package:mvvmproject/repository/Login_Repository.dart';

class AuthRegisterViewModel with ChangeNotifier{
  final _authrepository = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setloading(value){
    _loading = value;
    notifyListeners();
  }

  Future<void> RegisterApi(dynamic data, BuildContext context)async{

    try{
      setloading(true);
      final response = await _authrepository.registerApi(data).then((value){
        setloading(false);
        Navigator.pushNamed(context, RoutesName.Home_Screen);
        Utils().ShowSnackbar(context, 'Registser Successfully');
      }).onError((error, stackTrace){
        setloading(false);
        Utils().ShowSnackbar(context, error.toString());
      });
      return response;
    }
    catch(e){
      throw e;
    }
  }
}