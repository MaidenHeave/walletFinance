import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/widgets/widgets.dart';

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key});

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
                  child: Container(
                    height: screenSize.height * 0.2,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Image(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                                "https://cryptologos.cc/logos/tether-usdt-logo.png"),
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.02,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'USDT',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                '1 USD = 599 CFA',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.032,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenSize.width * 0.02),
                              child: TextField(
                                style: const TextStyle(fontSize: 18),

                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                // keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: InputBorder.none, hintText: "0"),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.width * 0.045,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenSize.width * 0.02),
                              child: const Text(
                                'Solde: 15000 FCFA',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03),
                  child: Container(
                    height: screenSize.height * 0.2,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Image(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            "https://assets.stickpng.com/images/5a7593fc64538c292dec1bbf.png"),
                                      ),
                                      SizedBox(
                                        width: screenSize.width * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'ETH',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            '1 ETH = 879 999 CFA',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.032,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: screenSize.width * 0.02),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(fontSize: 18),
                            // keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "0"),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.width * 0.045,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: screenSize.width * 0.02),
                          child: const Text(
                            'Solde: 3 ETH',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.swap_horiz,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
