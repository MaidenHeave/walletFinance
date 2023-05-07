import 'package:flutter/material.dart';

class WithdrawPage extends StatefulWidget {
  @override
  WithdrawPageState createState() => WithdrawPageState();
}

class WithdrawPageState extends State<WithdrawPage> {
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
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenSize.width * 0.03),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
