import 'package:flutter/material.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _switchValue = true;


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
          title: Text('Push Notifications', style: TextStyle(color: Colors.black),),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 50),
                    child: Text(
                        "Determine which of our notification works best for you at any time.",
                        style: TextStyle(
                            color: midNightBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notifications and Reciepts',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 8.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Push Notifications',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: CupertinoSwitch(
                                          value: _switchValue,
                                          onChanged: (value) {
                                            setState(() {
                                              _switchValue = value;
                                            });
                                        })
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 8.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Text Messages',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: CupertinoSwitch(
                                          value: _switchValue,
                                          onChanged: (value) {
                                            setState(() {
                                              _switchValue = value;
                                            });
                                        })
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 70.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 8.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Emails',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: CupertinoSwitch(
                                          value: _switchValue,
                                          onChanged: (value) {
                                            setState(() {
                                              _switchValue = value;
                                            });
                                        })
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Messages',
                                style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 30.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 8.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Wrizt Team',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: CupertinoSwitch(
                                          value: _switchValue,
                                          onChanged: (value) {
                                            setState(() {
                                              _switchValue = value;
                                            });
                                        })
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        
                        
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 55.0),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 300, height: 55),
                      child: ElevatedButton(
                        child: Text('Back',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.black,
                          onSurface: Colors.black,
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
