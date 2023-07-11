import 'dart:convert';
import 'dart:io';
import 'package:mvvmproject/data/App_Exceptions.dart';
import 'package:mvvmproject/data/network/BaseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{

  dynamic data;
  @override
  Future getApiResponse(String url) async{
    try{
      final response =await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      switch(response.statusCode){
        case 200:
          return data = jsonDecode(response.body.toString());
        case 404:
          return throw InValidURLException('You have enter an invalid Url');
        default:
          return throw FetchDataException('There is an error in fetching data');

      }
    }
    on SocketException{
      throw FetchDataException('No Internet');
    }
  }

  @override
  Future postApiResponse(String url, data)async {

    dynamic responseJson;

    try{
      final response =await http.post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
       responseJson = returnResponse(response);

    }
    on SocketException{
      throw FetchDataException('No Internet');
    }
    return responseJson;
  }



  dynamic returnResponse(http.Response response){
    switch(response.statusCode){

      case 200:
        dynamic responseJson = response.body;
        return responseJson;

      case 400:
        throw InValidURLException('You have Entered An Invalid Url');

      default:
         throw FetchDataException ('Internet error Occurred with Status code $response.statusCode.toString()');

    }
  }
}