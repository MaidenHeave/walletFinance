import 'package:flutter/material.dart';

class FooterSection extends StatefulWidget {
  @override
  _FooterSection createState() => _FooterSection();
}

class _FooterSection extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Colors.red,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
        backgroundColor: Colors.green,
      ),
    ]);
  }
}
