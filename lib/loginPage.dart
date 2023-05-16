import 'package:flutter/material.dart';
import 'package:wallet/home.dart';
import 'package:wallet/services/login.dart';

import 'models/models.dart';

extension ExtString on String {
  bool get isValidPassword {
    // final passwordRegExp = RegExp(
    //     r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    final passwordRegExp = RegExp(r'^$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    // final phoneRegExp = RegExp(r"^(?:0[7015])[0-9]{8}$");
    final phoneRegExp = RegExp(r"^$");
    return phoneRegExp.hasMatch(this);
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool started = false;
  bool isMobileNameOk = false;
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xfff2f4f7),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                  child: Image(
                      image: NetworkImage(
                          'https://uploads-ssl.webflow.com/63692bf32544bee8b1836ea6/636a6e764bdb11a70341fab4_owl-forest.png')),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Bienvenue sur',
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'TontineFi',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                !started
                    ? Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              started = !started;
                            });
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Commencer',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _mobileController,
                                // validator: (val) {
                                //   if (!val!.isValidPhone) {
                                //     return "Entrer un numero mobile correct";
                                //   }
                                // },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: 'Entrer numero mobile *',
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.4, color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.4, color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.4, color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.4, color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                // validator: (val) {
                                //   if (!val!.isValidPassword) {
                                //     return "Entrer un mot de passe correct";
                                //   }
                                // },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: 'Entrer mot de passe *',
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.4, color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.4, color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.4, color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.4, color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    LoginRequest request = LoginRequest(
                                      mobile: _mobileController.text,
                                      password: _passwordController.text,
                                    );
                                    // Send request
                                    try {
                                      LoginResponse response =
                                          await login(request);

                                      storeToken(response.token.toString());
                                      // TODO: Handle successful login (e.g. navigate to another screen)
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WalletHome()),
                                      );
                                    } catch (e) {
                                      // TODO: Handle error (e.g. show an alert dialog with the error message)
                                    }
                                  }
                                },
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Se connecter',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          )),
    );
  }
}
