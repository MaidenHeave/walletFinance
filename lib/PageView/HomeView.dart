import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/widgets/widgets.dart';

import '../models/models.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<TokenModel>(context, listen: false).fetchTokens();
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Token>>(
      create: (context) => fetchTokenList(),
      initialData: [],
      child: Column(
        children: [
          BalanceSection(),
          const SizedBox(
            height: 8,
          ),
          WalletButton(),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: DraggableScrollableSheet(
              initialChildSize: 1,
              maxChildSize: 1,
              expand: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return AssetSection();
              },
            ),
          ),
        ],
      ),
    );
  }
}
