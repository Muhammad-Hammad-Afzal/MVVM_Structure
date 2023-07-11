import 'package:mvvmproject/data/network/BaseApiService.dart';
import 'package:mvvmproject/data/network/NetworkApiServices.dart';
import 'package:mvvmproject/res/App_Url.dart';

class AuthRepository{
  final BaseApiServices  _apiServices = NetworkApiServices();


   Future<dynamic> loginApi(dynamic data)async{

     try{
       final response =await _apiServices.postApiResponse(AppUrl.LoginUrl, data);
       return response;
     }
     catch(e){
       throw e;
     }
   }

   Future<dynamic> registerApi(dynamic data)async{

     try{
       final response = await _apiServices.postApiResponse(AppUrl.RegisterUrl, data);
       return response;
     }
     catch(e){
       throw e;
     }
   }

}