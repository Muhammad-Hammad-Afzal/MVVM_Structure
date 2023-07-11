
abstract class BaseApiServices{
  Future getApiResponse(String url);

  Future<dynamic> postApiResponse(String url, dynamic data);
}