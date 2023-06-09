import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/pages/pages.dart';

import 'package:wallet/assets/paymentUrls.dart';

class selectNetworkWithdraw extends StatefulWidget {
  const selectNetworkWithdraw({Key? key}) : super(key: key);

  @override
  selectNetworkWithdrawState createState() => selectNetworkWithdrawState();
}

class selectNetworkWithdrawState extends State<selectNetworkWithdraw> {
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
                    return SelectRetraitContactPage(paymentName, paymentLogo);
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
                        style: const TextStyle(fontSize: 12),
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
