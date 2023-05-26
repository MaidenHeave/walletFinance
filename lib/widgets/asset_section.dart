import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallet/models/TokenModel.dart';

class AssetSection extends StatefulWidget {
  @override
  State<AssetSection> createState() => _AssetSectionState();
}

class _AssetSectionState extends State<AssetSection> {
  late Future<List<Token>> mockTokens;

  @override
  void initState() {
    super.initState();
    mockTokens = fetchTokenList(); // Fetch tokens in initState.
  }

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
            child: FutureBuilder<List<Token>>(
              future: mockTokens,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Token>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final asset = snapshot.data![index];
                      return Column(
                        children: [
                          Actif(
                            asset.name,
                            asset.symbol,
                            asset.prix,
                            '0',
                            asset.imageUrl,
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
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  // Display the shimmer effect
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 20),
                      itemCount:
                          10, // You can adjust the number of shimmering lines here
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 48.0,
                              height: 48.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 8.0,
                                    color: Colors.white,
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
            "$prix CFA",
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

Future<List<Token>> fetchTokenList() async {
  final tokens = await Token.fetchTokens("http://127.0.0.1:5000/tokens");

  return tokens;
}
