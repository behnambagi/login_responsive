import 'package:dio/dio.dart';
import 'package:panel_resume/core/interceptors.dart';
import 'package:panel_resume/core/utils/ui_utils.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/service/auth_service.dart';

class AuthController extends GetWithStorage{
  AuthClient client = AuthClient(addInterceptors(Dio()));

 Future<bool> registerUser(String userName, String email, String pass)async{
    var res =await client.createUser({"username":userName, "email":email, "password":pass});
    storage.saveToken(res['token']);
    return res!=null;
  }
 Future<bool> loginUser(String userName,String pass)async{


    try{
      var res =await client.loginUser({"username":userName, "password":pass});
      storage.saveToken(res['token']);
      return res !=null;

    }on DioError catch(e){
      if(e.response?.statusCode==400) {
        SnackBars.hasError("Your username or password is incorrect", title: "400");
      }
      return false;

    }


  }
}