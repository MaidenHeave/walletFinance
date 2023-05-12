import 'package:flutter/material.dart';
import 'package:wallet/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            builder: (BuildContext context, ScrollController scrollController) {
              return AssetSection();
            },
          ),
        ),
      ],
    );
  }
}
