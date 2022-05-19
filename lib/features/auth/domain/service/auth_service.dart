import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../core/utils/utils.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: BASE_URL_SERVER)
abstract class AuthClient{
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  @POST('register/')
  Future createUser(@Body() Map<String, dynamic> map);

  @POST('login/')
  Future loginUser(@Body() Map<String, dynamic> map);
}
