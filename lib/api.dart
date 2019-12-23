import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {

  String baseUrl = "http://apps.orchtech.com:81/law5/api/";

  var status;
  var errors;

    login(email , password) async{

        Map data = {
          "email":"$email",
          "password":"$password"
        };

        //encode Map to JSON
        var body = json.encode(data);

        var response = await http.post(baseUrl+'login',
            headers: {"Content-Type": "application/json"},
            body: body
        );

        status = response.statusCode;

        if(status == 200){
          var user = json.decode(response.body);
          _save(user['token']);
        }
    }


    Future<List> users() async{

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.get('token') ?? 0;

        var response = await http.get(baseUrl+'employee',
            headers: {"Authorization": "Bearer "+ token},
        );

        status = response.statusCode;

        print(response.body);
        if(status == 200){
          return json.decode(response.body);
        }
    }



    _save(String token) async{
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = token;
      prefs.setString(key, value);
    }

    read() async{
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value= prefs.get(key) ?? 0;
      print(value);
    }
}