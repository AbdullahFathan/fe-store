import 'package:fe_store/screens/account_page.dart';
import 'package:fe_store/screens/cart_page.dart';
import 'package:fe_store/screens/home_page.dart';
import 'package:flutter/material.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int _selectedIndex = 0;
  List<Widget> screens = const [HomePage(), CartPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (value) => setState(() {
            _selectedIndex = value;
          }),
          items: const [
            //{ Home Icon }
            BottomNavigationBarItem(
              label: "Home Page",
              icon: Icon(Icons.home_outlined),
            ),

            // { Saved Icon }
            BottomNavigationBarItem(
              label: "Cart Page",
              icon: Icon(Icons.shopping_cart_outlined),
            ),

            //{ Account Icon}
            BottomNavigationBarItem(
              label: "Account Page",
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
        body: SafeArea(child: screens[_selectedIndex]));
  }
}
