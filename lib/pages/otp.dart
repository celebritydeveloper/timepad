import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:wrizt/pages/authentication.dart';
import 'dart:async';

import 'package:wrizt/theme/constants.dart';

class Verification extends StatefulWidget {
  final String phone;
  const Verification({Key? key, required this.phone}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  late Timer _timer;
  int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 10000);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthApp()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade200),
                    child: Transform.rotate(
                      angle: 38,
                      child: Image(
                        image: AssetImage('assets/images/email.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Verification",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Please enter the 6 digit code sent to ${widget.phone}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey.shade500, height: 1.5),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  VerificationCode(
                      length: 6,
                      textStyle: TextStyle(fontSize: 20),
                      underlineColor: Colors.blueAccent,
                      keyboardType: TextInputType.number,
                      onCompleted: (value) {
                        setState(() {
                          _code = value;
                        });
                      },
                      onEditing: (value) {}),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't receive the OTP?",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade500),
                      ),
                      TextButton(
                          onPressed: () {
                            if (_isResendAgain) return;
                            resend();
                          },
                          child: Text(
                            _isResendAgain
                                ? "Try again in " + _start.toString()
                                : "Resend",
                            style: TextStyle(color: Colors.blueAccent),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  // MaterialButton(
                  //   disabledColor: Colors.grey,
                  //   onPressed: _code.length < 6 ? null : () { verify(); },
                  //   color: Colors.black,
                  //   minWidth: double.infinity,
                  //   height: 50,
                  //   child: _isLoading ? Container(
                  //     width: 20,
                  //     height: 20,
                  //     child: CircularProgressIndicator(
                  //       backgroundColor: Colors.white,
                  //       strokeWidth: 3,
                  //       color: Colors.black,
                  //     ),
                  //   ) : _isVerified ? Icon(Icons.check_circle, color: Colors.white, size: 30,) : Text("Verify", style: TextStyle(color: Colors.white),),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 350, height: 55),
                      child: ElevatedButton(
                        child: _isLoading
                            ? Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  strokeWidth: 3,
                                  color: Colors.black,
                                ),
                              )
                            : _isVerified
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : Text(
                                    "Verify",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                        onPressed: _code.length < 6
                            ? null
                            : () {
                                verify();
                                // Navigator.pop(context);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Verification()),
                                // );
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
              )),
        ));
  }
}
