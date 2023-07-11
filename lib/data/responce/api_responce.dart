import 'package:mvvmproject/data/responce/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.message, this.data);


  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;


  @override
  String toString() {
    return "Status: $status, Data : $data, Message: $message";
  }
}