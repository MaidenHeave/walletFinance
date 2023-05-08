import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/pages/withdrawPage.dart';

class WithdrawSelector extends StatefulWidget {
  @override
  WithdrawSelectorState createState() => WithdrawSelectorState();
}

class WithdrawSelectorState extends State<WithdrawSelector> {
  final List<Map<String, dynamic>> paymentOperator = [
    {
      "name": "Orange Money",
      "logoLink":
          "https://logos-marques.com/wp-content/uploads/2021/07/Orange-Money-logo.png"
    },
    {
      "name": "Moov Money",
      "logoLink":
          // "https://www.moov-africa.ci/wp-content/uploads/2022/05/icon-assistance-moovci_Plan-de-travail-1-1.png"
          "https://upload.wikimedia.org/wikipedia/fr/1/1d/Moov_Africa_logo.png"
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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.07,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenSize.width * 0.040),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.15,
              ),
              const Center(
                child: Text(
                  "Selectionner l'operateur",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: screenSize.height * 0.01),
                itemCount: paymentOperator.length,
                itemBuilder: (BuildContext context, int index) {
                  final operator = paymentOperator[index];
                  return Column(
                    children: [
                      WithdrawtMethod(
                        operator["name"],
                        operator["logoLink"],
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class WithdrawtMethod extends StatelessWidget {
  String paymentName;
  String paymentLogo;

  WithdrawtMethod(this.paymentName, this.paymentLogo, {Key? key})
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
              Navigator.of(context).push(
                CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return WithdrawPage();
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
                    children: [
                      const Padding(
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
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "transfert instantane vers $paymentName",
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
