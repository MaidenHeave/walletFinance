import 'package:flutter/material.dart';
import 'package:wallet/PageView/ExchangeView.dart';
import 'package:wallet/PageView/HomeView.dart';
import 'widgets/widgets.dart';

class WalletHome extends StatefulWidget {
  @override
  WalletHomeState createState() => WalletHomeState();
}

class WalletHomeState extends State<WalletHome> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffbabcbf),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeView(),
          ExchangeView(), // Your Exchange page here
          Container(color: Colors.blue), // Your Properties page here
          Container(color: Colors.yellow), // Your Tontines page here
          Container(color: Colors.purple),
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
