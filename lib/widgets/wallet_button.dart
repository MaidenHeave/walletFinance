import 'package:flutter/material.dart';

class WalletButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: MediaQuery.of(context).size.height / 7,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff2f4f7),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            // color: Colors.blue,
            width: MediaQuery.of(context).size.width * 0.55,
            child: const Text(
              'Composez vos sources de revenues',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.ctfassets.net/0idwgenf7ije/ipFaSfnWRb0s02vBqVHGW/04a4417fd5a1d3543f9886312b65ac4a/Gemini-Defi_Compound_Compound-_Lego_Blocks_of_DeFi.png?fm=webp")),
          )
        ],
      ),
    );
  }
}
