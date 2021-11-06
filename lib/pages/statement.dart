import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:material_dialogs/material_dialogs.dart';

class StatementScreen extends StatefulWidget {
  @override
  _StatementScreenState createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
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
          title: Text('Account Statement', style: TextStyle(color: Colors.black),),
          leading: BackButton(color: Colors.black,),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(30, 0, 20, 40),
                                child: Text(
                                    "Welcome, enter your details to gain unlimited access to offline payment.",
                                    style: TextStyle(
                                        color: midNightBlue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100),
                                    textAlign: TextAlign.center),
                              ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 30.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '@celebritydeveloper',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      TextButton(
                                        child: Text('Change',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: mainBlue,
                                            )),
                                        onPressed: () {
                                          Dialogs.bottomMaterialDialog(
                                            msg: 'We advice you change Wrizt Tag responsibly.',
                                            msgStyle: TextStyle(color: midNightBlue, fontSize: 14.0),
                                            titleStyle: TextStyle(color: midNightBlue, fontWeight: FontWeight.w600, fontSize: 20.0),
                                            title: 'Change Your Wrizt Tag',
                                            context: context,
                                            actions: [
                                              Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                                              child: Form(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                        borderSide: BorderSide.none,
                                                      ),            
                                                      fillColor: Colors.grey[50],
                                                      filled: true,
                                                      hintText: 'celebritydesigner',
                                                      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 17.0),
                                                      isDense: true,
                                                      prefixIcon: Icon(Icons.person, size: 20,),
                                                      contentPadding: EdgeInsets.all(10.0),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.transparent),
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(fontSize: 22.0,),
                                                  ),

                                                  SizedBox(height: 5.0,),

                                                  Container(
                                                    margin: EdgeInsets.symmetric(vertical: 20.0),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints.tightFor(width: 300, height: 55),
                                                      child: ElevatedButton(
                                                        child: Text('Change Wrizt Tag',
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
                                              )
                                              ),
                                            ),
                                            ]
                                          );
                                        },
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
                              'Full Name',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 30.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 13.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Saviour Essien Aniefiok',
                                    style: TextStyle(fontSize: 16.0),
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
                              'Phone',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 30.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 13.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '07034696973',
                                    style: TextStyle(fontSize: 16.0),
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
                              'Email Address',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 30.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 13.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'essiensaviour.a@gmail.com',
                                    style: TextStyle(fontSize: 16.0),
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
