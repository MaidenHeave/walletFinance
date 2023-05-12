import 'package:flutter/material.dart';

class AssetSection extends StatefulWidget {
  @override
  State<AssetSection> createState() => _AssetSectionState();
}

class _AssetSectionState extends State<AssetSection> {
  final List<Map<String, dynamic>> assets = [
    {
      "name": "Bitcoin",
      "symbol": "BTC",
      "prix": "FCFA 16,762,462.61",
      "variation": "-28,000",
      "url": "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
    },
    {
      "name": "Ethereum",
      "symbol": "ETH",
      "prix": "FCFA 1,106,679.00",
      "variation": "-14,000",
      "url":
          "https://www.pngall.com/wp-content/uploads/10/Ethereum-Logo-PNG.png",
    },
    {
      "name": "Arbitrum",
      "symbol": "ARB",
      "prix": "FCFA 800",
      "variation": "-14,000",
      "url":
          "https://altcoinsbox.com/wp-content/uploads/2023/03/arbitrum-logo.png",
    },
    {
      "name": "LINK",
      "symbol": "LNK",
      "prix": "FCFA 4178",
      "variation": "+ 344",
      "url":
          "https://seeklogo.com/images/C/chainlink-link-logo-CDF7095A43-seeklogo.com.png",
    },
    {
      "name": "Arbitrum",
      "symbol": "ARB",
      "prix": "FCFA 800",
      "variation": "-14,000",
      "url":
          "https://altcoinsbox.com/wp-content/uploads/2023/03/arbitrum-logo.png",
    },
    {
      "name": "Arbitrum",
      "symbol": "ARB",
      "prix": "FCFA 800",
      "variation": "-14,000",
      "url":
          "https://altcoinsbox.com/wp-content/uploads/2023/03/arbitrum-logo.png",
    },
    {
      "name": "Arbitrum",
      "symbol": "ARB",
      "prix": "FCFA 800",
      "variation": "-14,000",
      "url":
          "https://altcoinsbox.com/wp-content/uploads/2023/03/arbitrum-logo.png",
    },
    {
      "name": "Arbitrum",
      "symbol": "ARB",
      "prix": "FCFA 800",
      "variation": "-14,000",
      "url":
          "https://altcoinsbox.com/wp-content/uploads/2023/03/arbitrum-logo.png",
    },
    {
      "name": "Arbitrum",
      "symbol": "ARB",
      "prix": "FCFA 800",
      "variation": "-14,000",
      "url":
          "https://altcoinsbox.com/wp-content/uploads/2023/03/arbitrum-logo.png",
    },
  ];

  bool tri = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.14,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff2f4f7),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 2),
              child: SizedBox(
                width: 20,
                child: Divider(
                  thickness: 3,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 4), // Decrease the top padding here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Actifs',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Trier par: ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        !tri
                            ? const Text(
                                'Capitalisation',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            : const Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, top: 4), // Decrease the top padding here
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        tri = !tri;
                      });
                    },
                    child: const Icon(Icons.filter_list)),
              )
            ],
          ),

          // Add an Expanded widget to wrap the Column
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: assets.length,
              itemBuilder: (BuildContext context, int index) {
                final asset = assets[index];
                return Column(
                  children: [
                    Actif(
                      asset['name'],
                      asset['symbol'],
                      asset['prix'],
                      asset['variation'],
                      asset['url'],
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 0.8,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Actif extends StatelessWidget {
  String name;
  String symbol;
  String prix;
  String variation;
  String url;

  Actif(this.name, this.symbol, this.prix, this.variation, this.url, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Image(
          image: NetworkImage(url),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(symbol),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            prix,
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.4),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                variation,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "-2.28%",
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
