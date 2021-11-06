import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class LinkedCardPage extends StatefulWidget {
  static const String idScreen = 'onLinkedCardScreen';

  @override
  _LinkedCardScreenState createState() => _LinkedCardScreenState();
}

class _LinkedCardScreenState extends State<LinkedCardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          title: Text('Linked Cards', style: TextStyle(color: Colors.black),),
          leading: BackButton(color: Colors.black,),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                        padding: EdgeInsets.fromLTRB(20.0, 25.0, 25.0, 25.0),
                        width: MediaQuery.of(context).size.width,
                        height: 215.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: midNightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black87, Colors.black],
                            stops: [0.2, 0.9,]

                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset('assets/images/wrizt-white.png', width: 80.0,),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('5369 0300 0789 5252', style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w600)),
                                Text('07/23', style: TextStyle(fontSize: 16.0, color: Colors.white)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Saviour Essien', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w300)),
                                    Image.asset('assets/images/Mastercard-logo.png', width: 35.0,),
                                  ],
                                ),
                              ],
                            ),
                            
                          ],
                        )
                    ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 55.0),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 300, height: 55),
                      child: ElevatedButton(
                        child: Text('Add Card',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: mainBlue,
                          onPrimary: mainBlue,
                          onSurface: mainBlue,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
