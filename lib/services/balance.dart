import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallet/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/services/login.dart';

Future<String> fetchBalance(String symbol) async {
  if (symbol.isEmpty) {
    return '0';
  }
  String? token = await fetchToken(); // Fetch the stored token
  if (token == null) {
    throw Exception('User is not authenticated');
  }

  final http.Response response = await http.get(
    Uri.parse('http://127.0.0.1:5000/balance/$symbol'),
    headers: {
      'Authorization': 'Bearer $token'
    }, // Include the token in the request headers
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return json['balance'];
  } else {
    throw Exception('Failed to load balance');
  }
}
