/// token : "QpwL5tke4Pnpja7X4"

class LoginApiModel {
  LoginApiModel({
      String? token,}){
    _token = token;
}

  LoginApiModel.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
LoginApiModel copyWith({  String? token,
}) => LoginApiModel(  token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}