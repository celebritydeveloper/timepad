import 'package:flutter/material.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:material_dialogs/material_dialogs.dart';

class BankAccountPage extends StatefulWidget {
  static const String idScreen = 'onBankAccountScreen';

  @override
  _BankAccountScreenState createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountPage> {

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
          title: Text('Withdrawal Accounts', style: TextStyle(color: Colors.black),),
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
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8.0, 0, 5.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
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
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Kuda Bank',
                                            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '2005633656',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Dialogs.materialDialog(
                                            msg: 'Are you sure?',
                                            msgStyle: TextStyle(fontSize: 14.0,color: midNightBlue,),
                                            title: "Remove Account",
                                            titleStyle: TextStyle(fontSize: 22.0,color: midNightBlue,
                                              fontWeight: FontWeight.w500),
                                            color: Colors.white,
                                            context: context,
                                            actions: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.symmetric(vertical: 10.0),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints.tightFor(width: 300, height: 55),
                                                      child: ElevatedButton(
                                                        child: Text('Remove Account',
                                                            style: TextStyle(
                                                              fontSize: 18.0,
                                                              color: Colors.white,
                                                            )),
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          primary: Colors.redAccent[400],
                                                          onPrimary: Colors.redAccent[400],
                                                          onSurface: Colors.redAccent[400],
                                                          elevation: 0,
                                                          shadowColor: Colors.transparent,
                                                          shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(40.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  Container(
                                                    margin: EdgeInsets.symmetric(vertical: 10.0),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints.tightFor(width: 300, height: 55),
                                                      child: TextButton(
                                                        child: Text('Cancel',
                                                            style: TextStyle(
                                                              fontSize: 18.0,
                                                              color: midNightBlue,
                                                            )),
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              
                                            ]
                                          );
                                        },
                                        child: Icon(Icons.cancel_rounded, color: Colors.redAccent[400],)
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
                        child: Text('Add Bank Account',
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
