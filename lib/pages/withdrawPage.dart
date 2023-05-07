import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WithdrawPage extends StatefulWidget {
  String paymentLogo;
  String paymentName;
  WithdrawPage(this.paymentName, this.paymentLogo);
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  bool isEmpty = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.addListener(() {
      if (myController.text.isNotEmpty) {
        setState(() {
          isEmpty = false;
        });
      } else {
        isEmpty = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
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
                    width: screenSize.width * 0.37,
                  ),
                  Container(
                    width: screenSize.width * 0.09,
                    height: screenSize.height * 0.04,
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image(
                      fit: BoxFit.contain,
                      // height: 12,
                      image: NetworkImage(widget.paymentLogo),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.width * 0.02,
              ),
              const Center(
                child: Text(
                  'Numero a debiter',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.width * 0.015,
              ),
              const Center(
                child: Text(
                  '01 71 70 59 22',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: screenSize.width * 0.015,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenSize.width * 0.2,
                    right: screenSize.width * 0.2),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: myController,
                  textDirection: TextDirection.rtl,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      setState(() {
                        isEmpty = false;
                      });
                    }
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "CFA",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    suffixStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenSize.width * 0.03,
                    right: screenSize.width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'frais de depot',
                          style: TextStyle(fontSize: 13),
                        ),
                        Text('-')
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.003,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Montant final',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade700),
                        ),
                        Text('-',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade700))
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    isEmpty
                        ? Container(
                            width: double.infinity,
                            height: screenSize.height * 0.06,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 220, 224, 227),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Recharger',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              height: screenSize.height * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Recharger',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
