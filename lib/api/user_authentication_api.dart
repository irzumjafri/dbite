import 'package:http/http.dart'as http;
import 'package:dbite/model_classes/user_authentication.dart';

class UserAuthenticationApi{
  static const String url = 'http://192.168.0.106/dbite/login.php';

  static Future<List<UserAuthentication>> getUsers() async {
    try{
      final response = await http.get(url);
      if(response.statusCode==200){
        final List<UserAuthentication> users = userAuthenticationFromJson(response.body);
        return users;
      }else{
        return List<UserAuthentication>();
      }
    }catch(e){
      return List<UserAuthentication>();
    }
  }
}