import 'package:flutter/cupertino.dart';
import 'package:mvvmproject/data/network/NetworkApiServices.dart';
import 'package:mvvmproject/data/responce/api_responce.dart';
import 'package:mvvmproject/res/App_Url.dart';
import '../Model/Get_Api_Model.dart';



class GetApiViewModel with ChangeNotifier{
  NetworkApiServices networkApiServicess = NetworkApiServices();
  ApiResponse<GetApiModel> apiResponse = ApiResponse.loading();
  setresponse(ApiResponse<GetApiModel> response){
    apiResponse = response;
    notifyListeners();
  }



  // List<GetApiModel> list = [];
  Future< GetApiModel> getApiResults ()async{
    setresponse(ApiResponse.loading());

   try{
     setresponse(ApiResponse.completed());
     var response = await networkApiServicess.getApiResponse(AppUrl.pageUrl);
     // for(Map i in response){
     //   list.add(GetApiModel.fromJson(i));
     // }
     response = GetApiModel.fromJson(response);
     return response;
   }
   catch(e){
     throw setresponse(ApiResponse.error('There is an error in fetching data'));
   }
  }
}