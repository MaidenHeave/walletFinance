// ignore_for_file: file_names
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/login.dart';

class Token {
  final String name;
  final String symbol;
  final String imageUrl;
  final String prix;
  final String? balance;

  Token({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.prix,
    this.balance,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        name: json["name"],
        symbol: json["symbol"],
        imageUrl: json["symbol_url"],
        prix: json["price"],
        balance: json['balance']);
  }

  static List<Token> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => Token.fromJson(item)).toList();
  }

  static Future<List<Token>> fetchTokens(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      return fromJsonList(list);
    } else {
      throw Exception('Failed to load tokens');
    }
  }
}
