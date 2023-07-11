class AppExceptions implements Exception{
  final _message;
  final _perfix;

  AppExceptions([this._message, this._perfix]);

  @override
  String toString() {
    return "$_message$_perfix";
  }
}

class FetchDataException extends AppExceptions{
  FetchDataException(String? message) : super(message, '');
}

class InValidURLException extends AppExceptions{
  InValidURLException(String? message) : super(message, '');
}

class UnAuthorizedUrlException extends AppExceptions{
  UnAuthorizedUrlException(String? message) : super(message, 'UnAuthorized URL');
}

