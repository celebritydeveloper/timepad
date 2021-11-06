import 'package:flutter/material.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SupportPage extends StatefulWidget {
  static const String idScreen = 'onSupportScreen';

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {

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
          statusBarColor: midNightBlue,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        titleSpacing: 0.0,
        title: Text('Help & Support'),
        titleTextStyle: TextStyle(
          color: midNightBlue, fontSize: 18.0, fontWeight: FontWeight.w700),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close_outlined, size: 25.0, color: midNightBlue),
          onPressed: () {
            Navigator.pop(context);
          } //_onClickNotification,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 30.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 8.0, 0, 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '@ at us on Twitter',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 8.0, 0, 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Stalk us on Instagram',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 8.0, 0, 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Message us on Whatsapp',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 8.0, 0, 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'FAQs',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
            ],
          ),
        ));
  }
}
