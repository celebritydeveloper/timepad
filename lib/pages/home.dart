import 'package:wrizt/pages/send.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

import 'account.dart';
import 'wallet.dart';
import 'contact.dart';
import 'transactions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  
  List<Widget> _widgetOptions = <Widget>[
    BankingPage(),
    ContactPage(),
    SendMoneyScreen(),
    HistoryPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              backgroundColor: Colors.transparent,
              gap: 8,
              activeColor: mainBlue,
              iconSize: 28,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.transparent,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Iconsax.wallet,
                  text: 'Wallet',
                ),
                GButton(
                  icon: Iconsax.bitcoin_convert,
                  text: 'Crypto',
                ),
                GButton(
                  icon: Iconsax.bank,
                  text: 'Home',
                ),
                GButton(
                  icon: Iconsax.clock,
                  text: 'Transactions',
                ),
                GButton(
                  icon: Iconsax.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  }
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}