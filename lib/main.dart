import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/loginPage.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('authToken');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: token == null ? LoginPage() : WalletHome(),
    ),
  );
}
