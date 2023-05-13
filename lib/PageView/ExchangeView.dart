import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/widgets/widgets.dart';

class ExchangeView extends StatefulWidget {
  const ExchangeView({super.key});

  @override
  State<ExchangeView> createState() => _ExchangeViewState();
}

class _ExchangeViewState extends State<ExchangeView> {
  ExchangeCardData firstCard = ExchangeCardData(
    imageLink: 'https://cryptologos.cc/logos/tether-usdt-logo.png',
    balance: '15000 FCFA',
    cryptoName: 'USDT',
    cryptoValue: '1 USD = 599 CFA',
  );

  ExchangeCardData secondCard = ExchangeCardData(
    imageLink:
        'https://assets.stickpng.com/images/5a7593fc64538c292dec1bbf.png',
    balance: '3 ETH',
    cryptoName: 'ETH',
    cryptoValue: '1 ETH = 879 999 CFA',
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
                const Center(
                  child: Text(
                    'Exchange',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03),
                  child: ExchangeCard(data: firstCard),
                ),
                // SizedBox(
                //   height: screenSize.height * 0.01,
                // ),
                Padding(
                    padding: EdgeInsets.only(
                        left: screenSize.width * 0.03,
                        right: screenSize.width * 0.03),
                    child: ExchangeCard(data: secondCard)),
                // Padding(
                //   padding: EdgeInsets.only(
                //       left: screenSize.width * 0.03,
                //       right: screenSize.width * 0.03),
                //   child: ExchangeCard(
                //       title: "recevoir",
                //       imageLink:
                //           "https://assets.stickpng.com/images/5a7593fc64538c292dec1bbf.png",
                //       cryptoName: "ETH",
                //       cryptoValue: "1 ETH = 879 000",
                //       balance: "0"),
                // ),
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

class ExchangeCardData {
  final String imageLink;
  final String cryptoName;
  final String cryptoValue;
  final String balance;

  ExchangeCardData({
    required this.imageLink,
    required this.cryptoName,
    required this.cryptoValue,
    required this.balance,
  });
}

class ExchangeCard extends StatelessWidget {
  final ExchangeCardData data;

  const ExchangeCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
                            image: NetworkImage(data.imageLink),
                          ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.cryptoName,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                data.cryptoValue,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: screenSize.width * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              print('select token');
                            },
                            child: Image(
                              height: screenSize.height * 0.03,
                              image: const NetworkImage(
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
                // keyboardType: TextInputType.number,
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
                'Solde: ${data.balance}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
