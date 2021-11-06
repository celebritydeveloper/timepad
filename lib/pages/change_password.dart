import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordPage> {
  bool _isNewVisible = false;
  bool _isVisible = false;
  bool _isConfirmVisible = false;

  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if(password.length >= 8)
        _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password))
        _hasPasswordOneNumber = true;
    });
  }

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
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
        title: Text('Change Password', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          onChanged: (password) => onPasswordChanged(password),
                          obscureText: !_isNewVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey[50],
                            filled: true,
                            hintText: 'Old Password',
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18.0),
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isNewVisible = !_isNewVisible;
                                });
                              },
                              icon: _isNewVisible
                                  ? Icon(Icons.visibility, size: 20)
                                  : Icon(Icons.visibility_off, size: 20),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),

                        SizedBox(height: 50,),
                        
                        TextField(
                          onChanged: (password) => onPasswordChanged(password),
                          obscureText: !_isVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey[50],
                            filled: true,
                            hintText: 'New Password',
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18.0),
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: _isVisible
                                  ? Icon(Icons.visibility, size: 20)
                                  : Icon(Icons.visibility_off, size: 20),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _isPasswordEightCharacters ?  Colors.green : Colors.transparent,
                                  border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                                    Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                              ),
                              SizedBox(width: 10,),
                              Text("Contains at least 8 characters")
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _hasPasswordOneNumber ?  Colors.green : Colors.transparent,
                                  border: _hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                                    Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                              ),
                              SizedBox(width: 10,),
                              Text("Contains at least 1 number")
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0),

                        TextField(
                          onChanged: (password) => onPasswordChanged(password),
                          obscureText: !_isConfirmVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey[50],
                            filled: true,
                            hintText: 'Confirm New Password',
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18.0),
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isConfirmVisible = !_isConfirmVisible;
                                });
                              },
                              icon: _isConfirmVisible
                                  ? Icon(Icons.visibility, size: 20)
                                  : Icon(Icons.visibility_off, size: 20),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )),
                  ),
                  SizedBox(height: 30,),
                  
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25.0),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 350, height: 55),
                      child: ElevatedButton(
                        child: Text('Change Password',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                        onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SetProfilePage()),
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
              ),
            ],
          ),
        ));
  }
}
