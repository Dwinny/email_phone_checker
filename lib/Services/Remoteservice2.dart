import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../model_class/phone_class.dart';

class PhoneService {
  Future<PhoneVerify> getUsers(String phone) async {
    try {
      var url = Uri.parse(
          'https://phonevalidation.abstractapi.com/v1/?api_key=3b4f4adb3c464c2691d39cb918e913e2&phone=$phone');
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        var verify = phoneVerifyFromJson(response.body);
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
