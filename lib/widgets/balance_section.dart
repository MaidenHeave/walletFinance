import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/pages/pages.dart';

class BalanceSection extends StatelessWidget {
  final List<Map<String, dynamic>> paymentOperator = [
    {
      "name": "Orange Money",
      "logoLink":
          "https://logos-marques.com/wp-content/uploads/2021/07/Orange-Money-logo.png"
    },
    {
      "name": "Moov Money",
      "logoLink":
          "https://www.moov-africa.ci/wp-content/uploads/2022/05/icon-assistance-moovci_Plan-de-travail-1-1.png"
    },
    {
      "name": "MTN Money",
      "logoLink": "https://www.sanwi-informatique.com/img/cms/mtn-money.png"
    },
    {
      "name": "Wave Mobile",
      "logoLink":
          "https://cdn-website.partechpartners.com/media/images/Wave-logo-website.original.png"
    }
  ];

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
                  child: const Image(
                    image: NetworkImage(
                        "https://www.chathamhouse.org/sites/default/files/styles/uncropped_tiny/public/2023-03/PinClipart.com_murder-clip-art_5376441.png?itok=zKK8nOOz"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Josue Guessennd",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "01 70 70 57 44",
                        style: TextStyle(fontWeight: FontWeight.w300),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Compte Principal',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "1.000.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  width: screensize.width * 0.50,
                ),
                Padding(
                  padding: EdgeInsets.only(right: screensize.width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 15),
                          child: Icon(Icons.analytics),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
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
                      padding: const EdgeInsets.only(left: 10),
                      height: screensize.height * 0.15,
                      width: screensize.width * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 15),
                            child: Icon(Icons.upload_rounded),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
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
                      padding: const EdgeInsets.only(left: 10),
                      color: Colors.transparent,
                      height: screensize.height * 0.15,
                      width: screensize.width * 0.27,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 15),
                            child: Icon(Icons.download_rounded),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
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
