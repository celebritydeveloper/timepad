import 'package:wrizt/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() => runApp(MaterialApp(
  builder: (context, child) {
    return Directionality(textDirection: TextDirection.ltr, child: child!);
  },
    title: 'GNav',
    debugShowCheckedModeBanner: false,
    theme: ThemeData( fontFamily: 'Rota-Medium', primaryColor: Colors.grey[800],),
    home: LandingPage()
  )
);
