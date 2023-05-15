import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/widgets/widgets.dart';
import 'package:wallet/models/models.dart';

class ExchangeView extends StatefulWidget {
  final PageController pageController;
  const ExchangeView({required this.pageController, super.key});

  @override
  State<ExchangeView> createState() => _ExchangeViewState();
}

class _ExchangeViewState extends State<ExchangeView> {
  Token firstCard = Token(
    name: "USDT",
    symbol: "USDT",
    imageUrl: 'https://cryptologos.cc/logos/tether-usdt-logo.png',
    // balance: '15000 FCFA',
    prix: '1 USD = 599 CFA',
  );

  Token secondCard = Token(
    name: "ETH",
    symbol: "ETH",
    imageUrl: 'https://assets.stickpng.com/images/5a7593fc64538c292dec1bbf.png',
    // balance: '3 ETH',
    prix: '1 ETH = 879 999 CFA',
  );

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: screenSize.height,
        decoration: const BoxDecoration(
          color: Color(0xfff2f4f7),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.08,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenSize.width * 0.02),
                        child: GestureDetector(
                          onTap: () {
                            widget.pageController.jumpToPage(0);
                            FocusScope.of(context).unfocus();
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      const Text(
                        'Exchange',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      // Add an empty container to balance the space
                      Container(width: screenSize.width * 0.02),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03),
                  child: ExchangeCard(
                    data: firstCard,
                    onTokenSelect: (Token token) {
                      setState(() {
                        firstCard = token;
                      });
                    },
                    otherToken: firstCard,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: screenSize.width * 0.03,
                        right: screenSize.width * 0.03),
                    child: ExchangeCard(
                      data: secondCard,
                      onTokenSelect: (Token token) {
                        setState(() {
                          secondCard = token;
                        });
                      },
                      otherToken: secondCard,
                    )),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03),
                  child: Container(
                    width: double.infinity,
                    height: screenSize.height * 0.06,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 220, 224, 227),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Echanger',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: screenSize.height * 0.3,
              left: screenSize.width * 0.7,
              // You have to replace these with actual sizes
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    final temp = firstCard;
                    firstCard = secondCard;
                    secondCard = temp;
                  });
                },
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.swap_horiz,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExchangeCard extends StatelessWidget {
  final Token data;
  final ValueChanged<Token> onTokenSelect;
  final Token? otherToken;
  const ExchangeCard(
      {required this.data, required this.onTokenSelect, this.otherToken});

  @override
  Widget build(BuildContext context) {
    // List<Token> mockTokens = [
    //   Token(
    //     name: "Bitcoin",
    //     symbol: "BTC",
    //     imageUrl: "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
    //     prix: "FCFA 16,762,462.61",
    //     balance: "0",
    //   ),
    //   Token(
    //     name: "Ethereum",
    //     symbol: "ETH",
    //     imageUrl:
    //         "https://www.pngall.com/wp-content/uploads/10/Ethereum-Logo-PNG.png",
    //     prix: "FCFA 0",
    //     balance: "0",
    //   ),
    //   Token(
    //     name: "USDT",
    //     symbol: "USDT",
    //     imageUrl: 'https://cryptologos.cc/logos/tether-usdt-logo.png',
    //     balance: '15000 FCFA',
    //     prix: '1 USD = 599 CFA',
    //   ),
    // ];
    Future<List<Token>> mockTokens = fetchTokenList();

    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: Container(
        height: screenSize.height * 0.19,
        width: screenSize.width,
        decoration: BoxDecoration(
          border: Border.all(width: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenSize.width * 0.02,
                  top: screenSize.height * 0.008),
              // child: Text(data.title),
            ),
            SizedBox(
              height: screenSize.height * 0.06,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.height * 0.01,
                        left: screenSize.width * 0.02),
                    child: SizedBox(
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            fit: BoxFit.contain,
                            image: NetworkImage(data.imageUrl),
                          ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                data.prix,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: screenSize.width * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled:
                                    true, // This allows the modal to be of custom size.
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                builder: (BuildContext context) {
                                  return ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      child: FutureBuilder<List<Token>>(
                                        future: mockTokens,
                                        builder: (BuildContext context,
                                            AsyncSnapshot<List<Token>>
                                                snapshot) {
                                          if (snapshot.hasData) {
                                            return ListView.builder(
                                              itemCount: snapshot.data!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final asset =
                                                    snapshot.data![index];
                                                return ListTile(
                                                  leading: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16)),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          asset.imageUrl),
                                                    ),
                                                  ), // Replace with actual token icon
                                                  title: Text(
                                                    asset.name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ), //
                                                  subtitle: Text(asset.symbol),
                                                  trailing: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '0',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12.4),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            asset.prix,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    // Handle the token selection here
                                                    print(
                                                        'Selected token: ${asset.name}');
                                                    onTokenSelect(asset);
                                                    Navigator.pop(
                                                        context); // Close the modal
                                                  },
                                                );
                                              },
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text('${snapshot.error}');
                                          } else {
                                            // By default, show a loading spinner.
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Image(
                              height: screenSize.height * 0.03,
                              image: NetworkImage(
                                "https://static.thenounproject.com/png/1123247-200.png",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.02),
              child: TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(fontSize: 18),
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "0"),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.02),
              child: Text(
                'Solde: ${0}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class Token {
//   final String name;
//   final String symbol;
//   final String imageUrl;
//   final String prix;
//   final String balance;

//   Token({
//     required this.name,
//     required this.symbol,
//     required this.imageUrl,
//     required this.prix,
//     required this.balance,
//   });
// }

Future<List<Token>> fetchTokenList() async {
  final tokens = await Token.fetchTokens("http://127.0.0.1:5000/tokens");
  return tokens;
}
