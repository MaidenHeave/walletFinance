import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/pages/pages.dart';
import 'package:wallet/assets/paymentUrls.dart';
import 'package:wallet/services/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class BalanceSection extends StatefulWidget {
  @override
  State<BalanceSection> createState() => _BalanceSectionState();
}

class _BalanceSectionState extends State<BalanceSection> {
  String _name = '';
  String _mobile = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');
    User user = await fetchUserData(token!);
    setState(() {
      _name = user.name!;
      _mobile = user.mobile!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff2f4f7),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screensize.height * 0.055,
                  width: screensize.width * 0.12,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: Text(
                          _name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        _mobile,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screensize.width * 0.39,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Solde',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    FutureBuilder<String>(
                      future: fetchTotalBalance(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          var string = snapshot.data!;
                          return Text(
                            string,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                            'Error: ${snapshot.error}',
                            style: const TextStyle(fontSize: 3),
                          );
                        } else {
                          return const Text(
                            '0',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          );
                        }
                      },
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: screensize.width * 0.03),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '+200%',
                        style: TextStyle(
                          color: Color(0xff469c60),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '1000',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 23),
            child: Container(
              height: screensize.height * 0.1,
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: screensize.height * 0.15,
                    width: screensize.width * 0.28,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 0, top: 15),
                          child: Icon(Icons.analytics),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            "Statistiques",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height *
                                0.75, // Set height to 75% of the screen height
                            decoration: const BoxDecoration(
                              color: Color(0xfff2f4f7),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Methodes de paiement',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  // Wrap ListView.builder with Expanded
                                  child: ListView.builder(
                                      padding: const EdgeInsets.only(top: 8),
                                      itemCount: paymentOperator.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final operator = paymentOperator[index];
                                        return Column(
                                          children: [
                                            DepositMethod(
                                              operator['name'],
                                              operator['logoLink'],
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                const SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 0),
                      height: screensize.height * 0.15,
                      width: screensize.width * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 15),
                            child: Icon(Icons.upload_rounded),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              "Deposer",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            return selectNetworkWithdraw();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 0),
                      color: Colors.transparent,
                      height: screensize.height * 0.15,
                      width: screensize.width * 0.27,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 15),
                            child: Icon(Icons.download_rounded),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              "Retirer",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class DepositMethod extends StatelessWidget {
  String paymentName;
  String paymentLogo;

  DepositMethod(this.paymentName, this.paymentLogo, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return SelectDepositor(paymentName, paymentLogo);
                  },
                ),
              );
            },
            child: Container(
              height: 95,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          paymentName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 15),
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: Image(
                            fit: BoxFit.contain,
                            image: NetworkImage(paymentLogo),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 2, left: 20),
                        child: SizedBox(
                          width: 15,
                          height: 15,
                          child: Image(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/61/61227.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "rechargement instantane (frais de l'operateur 1%)",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

Future<String> fetchTotalBalance() async {
  String? token = await fetchToken(); // Fetch the stored token
  if (token == null) {
    throw Exception('User is not authenticated');
  }

  final http.Response response = await http.get(
    Uri.parse('http://127.0.0.1:5000/balance'),
    headers: {
      'Authorization': 'Bearer $token'
    }, // Include the token in the request headers
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return json['total_balance'];
  } else {
    throw Exception('Failed to load balance');
  }
}

Future<User> fetchUserData(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Get cached data from shared preferences
  String cachedName = prefs.getString('name') ?? '';
  String cachedMobile = prefs.getString('mobile') ?? '';

  // If the cache is not empty, return the User object with cached data
  if (cachedName.isNotEmpty && cachedMobile.isNotEmpty) {
    return User(
      name: cachedName,
      mobile: cachedMobile,
    );
  }

  // Fetch data from server
  final response = await http.get(
    Uri.parse('http://127.0.0.1:5000/user'),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);

    // Save data to shared preferences
    await prefs.setString('name', json['name']);
    await prefs.setString('mobile', json['mobile']);

    return User(
      name: json['name'],
      mobile: json['mobile'],
    );
  } else {
    throw Exception('Failed to load user data');
  }
}
