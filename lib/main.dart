import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timepad/pages/home.dart';



void main() => runApp(MaterialApp(
  builder: (context, child) {
    return Directionality(textDirection: TextDirection.ltr, child: child!);
  },
  title: 'Timepad',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    fontFamily: 'Rubik',
    primaryColor: Colors.grey[800],
  ),
  home: HomePage())
);
