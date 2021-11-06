import 'package:animate_do/animate_do.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wrizt/pages/change_password.dart';
import 'package:wrizt/pages/change_pin.dart';
import 'package:wrizt/pages/notification.dart';
import 'package:wrizt/pages/profile.dart';
import 'package:wrizt/pages/qr_code.dart';
import 'package:wrizt/theme/constants.dart';

import 'activity.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ActivityScreen()));
            },
            icon: Icon(Iconsax.notification, size: 30),
          ),
          actions: [
            IconButton(
              icon: Icon(Iconsax.scan, size: 30, color: Colors.grey.shade700),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => QRCode()));
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
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
                            color: Colors.grey.shade800,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/images/avatar-1.png')),
                      Positioned(
                        top: 80,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _imageUpload();
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
                    "Edidiong Ekong",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "@bigchief",
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
            height: 60,
          ),
          FadeInLeft(
            duration: Duration(milliseconds: 500),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
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
                child: Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Iconsax.profile_2user, color: Colors.black),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Iconsax.arrow_right_3,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInLeft(
            duration: Duration(milliseconds: 700),
            child: GestureDetector(
              onTap: () {
                Share.share(
                    'Make seemless and contactless payment now with https://mywrizt.com',
                    subject: 'Payment for Everyone!');
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
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
                child: Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Iconsax.add, color: Colors.black),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Invite Friends',
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Iconsax.arrow_right_3,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              FadeInLeft(
                duration: Duration(milliseconds: 800),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePasswordPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Iconsax.lock,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Change Password',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Iconsax.arrow_right_3,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                endIndent: 10,
                indent: 15,
              ),
              FadeInLeft(
                duration: Duration(milliseconds: 800),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePinPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Iconsax.lock_1,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Change Pin',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Iconsax.arrow_right_3,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          FadeInLeft(
            duration: Duration(milliseconds: 700),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationPage()));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
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
                child: Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Iconsax.notification_1, color: Colors.black),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Push Notification',
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Iconsax.arrow_right_3,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              FadeInLeft(
                duration: Duration(milliseconds: 800),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePasswordPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Iconsax.support,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Help & Support',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Iconsax.arrow_right_3,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                endIndent: 10,
                indent: 15,
              ),
              FadeInLeft(
                duration: Duration(milliseconds: 800),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePinPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Iconsax.book,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Legal',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Iconsax.arrow_right_3,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          FadeInLeft(
            duration: Duration(milliseconds: 900),
            child: GestureDetector(
              onTap: () {
                Dialogs.bottomMaterialDialog(
                    msg: 'Sure you want to logout of Wrizt?',
                    msgStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    title: "Logout",
                    titleStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    color: Colors.white,
                    context: context,
                    actions: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 300, height: 55),
                              child: TextButton(
                                child: Text('Cancel',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    )),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: double.infinity,
                                height: 50,
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
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
                child: Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Iconsax.logout, color: Colors.grey.shade700),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Iconsax.arrow_right_3,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}

void _imageUpload() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      //allowedExtensions: ['jpg', 'png', 'jpeg'],
      withData: false,
      withReadStream: true,
    );
    if (result != null) {
      File file = File(result.files.single.path.toString());
      print(file);
    } else {
      // User canceled the picker
    }
}
