import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:wrizt/pages/login.dart';
import 'package:wrizt/pages/register.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                      color: midNightBlue,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Svg('assets/images/Whangaehu.svg'),
                      ),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 80.0)),
                    ),
                    //child: Center(child: Image.asset('assets/images/logo.png', width: 50,)),
                  ),
                  Positioned(
                    top: 100,
                    child: Image.asset('assets/images/wrizt-white.png', width: 150),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Payments for Everyone',
                      style: TextStyle(
                          color: midNightBlue,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                    child: Text('Make contactless payment with ease anytime, anywhere.',
                        style: TextStyle(
                            color: midNightBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 55.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 230, height: 45),
                          child: ElevatedButton(
                            child: Text('Create an Account',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
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
                        SizedBox(height: 15.0),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 230, height: 45),
                          child: ElevatedButton(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: midNightBlue,
                              ),
                            ),
                            onPressed: () {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              primary: lightGray,
                              onPrimary: lightGray,
                              onSurface: lightGray,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'By tapping Create an Account and using Wrizt. You agree to our ',
                          style: TextStyle(color: darkGray, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms ',
                              style: TextStyle(
                                color: midNightBlue,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                );
                              }),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(color: darkGray, fontSize: 15),),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                color: midNightBlue,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => KeyboardDemo()),
                                // );
                              })
                          ],
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
      )
    );
  }
}

