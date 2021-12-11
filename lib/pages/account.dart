import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timepad/theme/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String phone = "";
  String firstname = "";
  String lastname = "";
  String tag = "";

  _getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.containsKey("wriztUser")) {
      var user = localStorage.getString("wriztUser");
      var details = json.decode(user!);
      
      setState(() {
        phone = details["data"]["phone"];
        firstname = details["data"]["firstname"];
        lastname = details["data"]["lastname"];
        tag = details["data"]["wrizttag"];
      }
    );     

      return ({phone, firstname, lastname, tag});
    }
    print('phone is Bearer $phone');
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        leading: IconButton(
          color: Colors.grey.shade700,
          onPressed: () {
          },
            icon: Icon(Iconsax.notification, size: 30),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.ios_share, size: 30, color: Colors.grey.shade700),
              onPressed: () {
              },
            ),
            // IconButton(
            //   icon: Icon(Iconsax.more, color: Colors.grey.shade700),
            //   onPressed: () {},
            // ),
          ],
          centerTitle: true,
          title: AnimatedOpacity(
            opacity: 1.0, //_isScrolled ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    color: midNightBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
          SizedBox(
            height: 10,
          ),
          FadeInDown(
            duration: Duration(milliseconds: 500),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          width: 110.0,
                          height: 110.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            shape: BoxShape.circle,
                          ),
                          child: Lottie.asset(
                            'assets/lottie/avatar.json',
                          )),
                      Positioned(
                        top: 80,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                           // _imageUpload();
                          },
                          child: Container(
                              width: 30.0,
                              height: 30.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                    offset: Offset(1, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Iconsax.camera,
                                color: Colors.grey.shade700,
                                size: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${firstname}  ${lastname}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("@${tag}",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                      Icon(
                        Icons.verified_sharp,
                        color: mainBlue,
                        size: 18.0,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          FadeInLeft(
            duration: Duration(milliseconds: 500),
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              padding: EdgeInsets.fromLTRB(10, 10.0, 10, 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("View Profile",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              ),
                              Icon(
                                Iconsax.arrow_right_3,
                                color: dark,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          
                        ],
                      ),
                    ),
                  ),


                  Divider(
                    height: 0,
                    endIndent: 0,
                    indent: 0,
                  ),

                  SizedBox(height: 15.0),

                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Security & Password",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              ),
                              Icon(
                                Iconsax.arrow_right_3,
                                color: dark,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          
                        ],
                      ),
                    ),
                  ),

                  Divider(
                    height: 0,
                    endIndent: 0,
                    indent: 0,
                  ),

                  SizedBox(height: 15.0),

                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Add Withdrawal Bank",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              ),
                              Icon(
                                Iconsax.arrow_right_3,
                                color: dark,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          
                        ],
                      ),
                    ),
                  ),

                  Divider(
                    height: 0,
                    endIndent: 0,
                    indent: 0,
                  ),



                  SizedBox(height: 15.0),

                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Help & Support",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              ),
                              Icon(
                                Iconsax.arrow_right_3,
                                color: dark,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          
                        ],
                      ),
                    ),
                  ),

                  Divider(
                    height: 0,
                    endIndent: 0,
                    indent: 0,
                  ),



                  SizedBox(height: 15.0),

                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Privacy Policy",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              ),
                              Icon(
                                Iconsax.arrow_right_3,
                                color: dark,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          
                        ],
                      ),
                    ),
                  ),

                  Divider(
                    height: 0,
                    endIndent: 0,
                    indent: 0,
                  ),

                  SizedBox(height: 15.0),

                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Logout",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              ),
                              Icon(
                                Iconsax.arrow_right_3,
                                color: Colors.redAccent,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ])));
  }
}

// void _imageUpload() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.any,
//     //allowedExtensions: ['jpg', 'png', 'jpeg'],
//     withData: false,
//     withReadStream: true,
//   );
//   if (result != null) {
//     File file = File(result.files.single.path.toString());
//     print(file);
//   } else {
//     // User canceled the picker
//   }
// }
