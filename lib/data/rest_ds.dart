import 'dart:async';

import 'package:wassa/utils/network_util.dart';
import 'package:wassa/models/user.dart';


class RestDatasource {

  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://bit.ly/2SdwYQi/";
  static final LOGIN_URL = BASE_URL + "auth/login";
  //pour le token Key
  //static final _API_KEY =

  Future<User> login(String email, String password) {
    return _netUtil.post(LOGIN_URL, body :{
      //"token" : _API_KEY,
      "email" : email,
      "password" : password
    }).then((dynamic res){
      print(res.toString());
      if(res["error"]) throw new Exception((res["error_msg"]));
      return new User.map(res["user"]);
    });
  }
}