import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class WalletHome extends StatefulWidget {
  @override
  WalletHomeState createState() => WalletHomeState();
}

class WalletHomeState extends State<WalletHome> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffbabcbf),
      body: Column(
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffbabcbf),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xff111212),
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.swap_horiz,
              color: Colors.black,
            ),
            label: 'Exchange',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.domain,
              color: Colors.black,
            ),
            label: 'Properties',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.handshake,
              color: Color(0xff111212),
            ),
            label: 'Tontines',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Color(0xff111212),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
