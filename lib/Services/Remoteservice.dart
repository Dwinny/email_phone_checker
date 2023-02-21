import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../model_class/email_class.dart';

class EmailService {
  Future<Emailverify> getUsers(String email) async {
    try {
      var url = Uri.parse(
          'https://emailvalidation.abstractapi.com/v1/?api_key=f5cb8bc71c904298ab3c60c0e8ef464f&email=$email');
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        var verify = emailverifyFromJson(response.body);
        return verify;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (Exception(e.toString()));
    }

//   await Future.delayed(Duration(seconds: 3));
//   final response = json.decode(result.body);
//   int emailResult = (response as List).first;

//   return emailResult;
//
  }
}
