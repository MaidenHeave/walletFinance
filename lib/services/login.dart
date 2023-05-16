import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallet/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('authToken', token);
}

Future<String?> fetchToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('authToken');
}

Future<LoginResponse> login(LoginRequest request) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:5000/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(request.toJson()),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login');
  }
}
