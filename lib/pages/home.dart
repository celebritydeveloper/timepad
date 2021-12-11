import 'package:iconsax/iconsax.dart';
import 'package:timepad/models/TimePadIcon.dart';
import 'package:timepad/pages/analytics.dart';
import 'package:timepad/pages/create_task.dart';
import 'package:timepad/pages/index.dart';
import 'package:timepad/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  
  List<Widget> _widgetOptions = <Widget>[
    IndexPage(),
    CreateTaskPage(),
    AnalyticsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate,
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
                
                GButton(icon: Iconsax.clock, iconColor: Colors.black),
                
                GButton(icon: Iconsax.add_circle, iconColor: Colors.black),

                GButton(icon: Icons.pie_chart_sharp, iconColor: Colors.black),
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