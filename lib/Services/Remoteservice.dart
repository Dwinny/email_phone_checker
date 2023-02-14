import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getData() async {
  final result = await http.get(
    Uri.parse(
        'https://emailvalidation.abstractapi.com/v1/?api_key=f5cb8bc71c904298ab3c60c0e8ef464f&email=chiomag58@gmail.com'),
  );
  await Future.delayed(Duration(seconds: 3));
  final response = json.decode(result.body);
  int emailResult = (response as List).first;

  return emailResult;
}
