import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/pages/depositPage.dart';

class SelectDepositor extends StatefulWidget {
  String paymentMethod;
  String logoUrl;

  SelectDepositor(this.paymentMethod, this.logoUrl);
  @override
  _SelectDepositorState createState() => _SelectDepositorState();
}

class _SelectDepositorState extends State<SelectDepositor> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenSize.height * 0.08,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenSize.width * 0.02),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
              SizedBox(
                width: screenSize.width * 0.1,
              ),
              const Text(
                'Choisissez le numero a debiter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) {
                      return DepositPage(widget.paymentMethod, widget.logoUrl);
                    },
                  ),
                );
              },
              child: Container(
                height: screenSize.height * 0.1,
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 0.2),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width * 0.01),
                      child: Container(
                        height: screenSize.height * 0.045,
                        width: screenSize.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Utiliser mon numero',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          Text(
                            '01 71 70 59 22',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: GestureDetector(
              onTap: () {
                _showCustomDialog(context);
              },
              child: Container(
                height: screenSize.height * 0.1,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 220, 224, 227),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width * 0.04,
                      ),
                      child: const Icon(Icons.add_box_rounded),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ajoutez un nouveau numero de depot',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          Text(
                            widget.paymentMethod, // Here
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _showCustomDialog(BuildContext context) async {
  var screenSize = MediaQuery.of(context).size;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          height: screenSize.height * 0.35,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.03),
                  child: const Center(
                    child: Text(
                      'Tapez un nouveau numero',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
                  child: Container(
                    width: screenSize.width,
                    color: const Color.fromARGB(255, 220, 224, 227),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Numero de telephone',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
                  child: Container(
                    height: screenSize.height * 0.1,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xfff5e393),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: screenSize.width * 0.02),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            size: screenSize.height * 0.05,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          ),
                          const Flexible(
                            child: Text(
                              "Merci de bien verifier le numero avant de l'ajouter. Un delai de 15 jours a ete defini",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.018,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width * 0.04),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.3,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 220, 224, 227),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text('Annuler'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenSize.width * 0.04),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.3,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 220, 224, 227),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text('Ajouter'),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
