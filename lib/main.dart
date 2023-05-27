import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/PageView/ExchangeView.dart';
import 'package:wallet/loginPage.dart';
import 'home.dart';
import 'models/models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('authToken');
  runApp(
    ChangeNotifierProvider(
      create: (context) => TokenModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token == null ? LoginPage() : WalletHome(),
      ),
    ),
  );
}
