import 'dart:convert';

import 'package:wrizt/pages/login.dart';
import 'package:http/http.dart' as http;
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wrizt/utils/api.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  bool isLoading = false;

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  bool _isVisible = false;
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldstate,
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
          title: (isLoading) ? null : Text('Create an Account', style: TextStyle(color: Colors.black),),
          leading: (isLoading) ? null : BackButton(color: Colors.black,),
        ),
        body: (isLoading) ? Center(
          child: SizedBox(
              child: CircularProgressIndicator(color: Colors.blue,),
              height: 50.0,
              width: 50.0,
            ),
          ) : SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 25, 20, 40),
                    child: Text(
                        "Welcome, enter your details to gain unlimited access to offline payment.",
                        style: TextStyle(
                            color: midNightBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.grey[50],
                                filled: true,
                                hintText: 'First Name',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 18.0),
                                isDense: true,
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 20,
                                ),
                                contentPadding: EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                              onSaved: (value) {
                                firstNameController.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'First Name cannot be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.grey[50],
                                filled: true,
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 18.0),
                                isDense: true,
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 20,
                                ),
                                contentPadding: EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onSaved: (value) {
                                lastNameController.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Last Name cannot be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.grey[50],
                                filled: true,
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 18.0),
                                isDense: true,
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 20,
                                ),
                                contentPadding: EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email cannot be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                print(number.phoneNumber);
                              },
                              onInputValidated: (bool value) {
                                print(value);
                              },

                              selectorConfig: SelectorConfig(
                                selectorType: PhoneInputSelectorType.DROPDOWN,
                              ),
                              ignoreBlank: false,
                              countries: ['NG', 'GH', 'KE', 'ZA'],
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: TextStyle(color: Colors.black),
                              initialValue: number,
                              hintText: 'Phone Number',
                              textFieldController: phoneController,
                              formatInput: false,
                              keyboardType: TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              inputBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              // decoration: InputDecoration(
                              //   border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(20),
                              //     borderSide: BorderSide.none,
                              //   ),
                              onSaved: (PhoneNumber number) {
                                print('On Saved: $number');
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: !_isVisible,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.grey[50],
                                filled: true,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 18.0),
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
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 55.0),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 350, height: 55),
                      child: ElevatedButton(
                        child: 
                        // isLoading
                        //     ? CircularProgressIndicator(
                        //         color: Colors.white,
                        //       )
                        //     : 
                            Text('Create Account',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                )),
                        onPressed: () => registerUser(),
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade500),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  String apiUrl() {
    String _apiUrl;
    _apiUrl = "${Constant.baseUrl}/user/register";
    return _apiUrl;
  }

  Map<String, dynamic> data() {
    return {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passwordController.text
    };
  }

  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };

  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      if (this.mounted) {
            setState(() {
              isLoading = true;
            });
      }
      try {
        isLoading = true;
        //var res = await Network().postData(data(), "/user/register");
        var res = await http.post(
          Uri.parse('https://api.mywrizt.com/user/register'),
          body: jsonEncode(<String, String>{
            'firstname': firstNameController.text,
            'lastname': lastNameController.text,
            'email': emailController.text,
            'phone': phoneController.text,
            'password': passwordController.text
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        print("It works");
        print(res.statusCode);
        var body = json.decode(res.body);
        print(body);
        if (res.statusCode == 201) {
          // print(body["profile"]);
          print(body);
          if (this.mounted) {
            setState(() {
              isLoading = false;
            });
          }
          ;
          //   // SharedPreferences localStorage = await SharedPreferences
          //   //     .getInstance();
          //   // localStorage.setString('artistPersonal', json.encode(body));
          //   //Provider.of<AppProvider>(context, listen: false).updateAccount(body);
          //   // rootNavigator: true
          //   Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(builder: (context) => ArtistBusiness()));
          // }

        } else {
          print(res.body);
          // print(body);
          // if(body["errors"]!=null){
          //   _showMsg(body["errors"].toString().replaceAll('{', '').replaceAll('}', '').replaceAll('[', '').replaceAll(']', ''));
          // }else if(body["message"]!=null){
          //   _showMsg(body["message"].toString().replaceAll('{', '').replaceAll('}', '').replaceAll('[', '').replaceAll(']', ''));
          // }

          if (this.mounted) {
            setState(() {
              isLoading = false;
            });
          }
        }
      } on Exception catch (e) {
        //_showMsg(e.toString());
        if (this.mounted) {
          setState(() {
            isLoading = false;
          });
        }
        print(e);
      }
    } else {
      print("It doesn't work");
    }
  }
}
