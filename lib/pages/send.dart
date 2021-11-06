import 'package:flutter/services.dart';
import 'package:flutter_screen_lock/configurations/input_button_config.dart';
import 'package:flutter_screen_lock/configurations/screen_lock_config.dart';
import 'package:flutter_screen_lock/configurations/secret_config.dart';
import 'package:flutter_screen_lock/configurations/secrets_config.dart';
import 'package:flutter_screen_lock/functions.dart';
import 'package:flutter_screen_lock/input_controller.dart';
import 'package:flutter_screen_lock/screen_lock.dart';
import 'package:local_auth/local_auth.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:wrizt/models/shaker.dart';
import 'package:wrizt/pages/contact.dart';
import 'package:wrizt/pages/qr_code.dart';
import 'package:wrizt/pages/qr_scanner.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'activity.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticate(
      localizedReason: 'Please authenticate',
      biometricOnly: true,
    );
    if (didAuthenticate) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRScanner()),
      );
    }
  }

  var amount = TextEditingController(text: "0.00");
  final shakeKey = GlobalKey<ShakeWidgetState>();
  List numberAsList = [];

  String money = '0';

  static const _locale = 'en';
  String _formatNumber(s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String getCurrency() {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "NGN");
    return format.currencyName.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: IconButton(
            color: Colors.grey.shade700,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityScreen()));
            },
            icon: Icon(Iconsax.notification, size: 30),
          ),
          actions: [
            IconButton(
              icon: Icon(Iconsax.scan, size: 30, color: Colors.grey.shade700),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QRCode()));
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${getCurrency()}',
                      style: TextStyle(
                        color: midNightBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${_formatNumber('18400000')}',
                      style: TextStyle(
                        color: midNightBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              FadeInDown(
                  duration: Duration(milliseconds: 500),
                  child: ShakeWidget(
                    key: shakeKey,
                    // 5. configure the animation parameters
                    shakeCount: 3,
                    shakeOffset: 10,
                    shakeDuration: Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: RichText(
                          text: TextSpan(
                        text: '${getCurrency()}',
                        style: TextStyle(
                          fontSize: 30,
                          color: midNightBlue.withOpacity(0.8),
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                              text: _formatNumber(money),
                              style: TextStyle(
                                fontSize: 60,
                                color: midNightBlue.withOpacity(0.8),
                                fontWeight: FontWeight.w400,
                              )),
                          if (money != '')
                            TextSpan(
                                text: '',
                                style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.grey.withOpacity(0.5),
                                  fontWeight: FontWeight.w300,
                                )),
                        ],
                      )),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 25,
                  ),
                  itemCount: numbers.length,
                  itemBuilder: (BuildContext context, int index) {
                    int number = numbers[index];
                    if (index == 9) return Container(height: 0, width: 0);
                    return InkWell(
                      borderRadius: BorderRadius.circular(360),
                      onTap: () {
                        if (index == 11) {
                          try {
                            setState(() => money = money.replaceRange(
                                money.length - 1, money.length, ''));
                          } catch (e) {
                            print("Error removing $e");
                          }
                        } else {
                          setState(() => money = '$money$number');
                        }
                      },
                      child: Container(
                        child: index == 11
                            ? Icon(
                                Icons.chevron_left,
                                color: midNightBlue,
                                size: 45,
                              )
                            : Text(
                                '$number',
                                style: TextStyle(
                                    color: midNightBlue, fontSize: 35),
                              ),
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //   color: Colors.black38,
                        //   shape: BoxShape.circle,
                        // ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 180, height: 55),
                      child: MaterialButton(
                        height: 55,
                        elevation: 0,
                        minWidth: double.infinity,
                        onPressed: () {
                          if (money.length < 1) {
                            shakeKey.currentState?.shake();
                          } else if (money.length > 8) {
                            shakeKey.currentState?.shake();
                            Fluttertoast.showToast(
                                msg: "Double Click to exit app",
                                backgroundColor: Colors.black,
                                textColor: Colors.white);
                          } else {
                            Dialogs.bottomMaterialDialog(
                              msgStyle: TextStyle(fontSize: 15.0,color: Colors.black,),
                              title: "Request Type",
                              titleStyle: TextStyle(fontSize: 22.0,color: Colors.black,
                                fontWeight: FontWeight.w500),
                              color: Colors.white,
                              context: context,
                              actions: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => QRCode()),
                                        );
                                          },
                                      icon: Icon(Iconsax.scan, size: 40, color: Colors.blue.shade700)),
                                        Text('QR Code', style: TextStyle(fontSize: 15.0, color: Colors.black,))
                                      ],
                                    ),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ContactPage()),
                                          );
                                        }, icon: Icon(Iconsax.hashtag_up, size: 40, color: Colors.blue.shade700)),
                                        Text('User Tag', style: TextStyle(fontSize: 15.0, color: Colors.black,))
                                      ],
                                    ),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ContactPage()),
                                          );
                                        }, icon: Icon(Iconsax.hashtag_up, size: 40, color: Colors.blue.shade700)),
                                        Text('User Tag', style: TextStyle(fontSize: 15.0, color: Colors.black,))
                                      ],
                                    ),                             
                                  ],
                                ),
                                
                              ]
                            );
                          }
                        },
                        color: Color.fromRGBO(13, 41, 70, 1),
                        child: Text(
                          "Request",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 180, height: 55),
                      child: MaterialButton(
                        height: 55,
                        elevation: 0,
                        minWidth: double.infinity,
                        onPressed: () {
                          if (money.length < 1) {
                            shakeKey.currentState?.shake();
                          } else if (money.length > 8) {
                            shakeKey.currentState?.shake();
                          } else {
                            Dialogs.bottomMaterialDialog(
                              msgStyle: TextStyle(fontSize: 15.0,color: Colors.black,),
                              title: "Send Via",
                              titleStyle: TextStyle(fontSize: 22.0,color: Colors.black,
                                fontWeight: FontWeight.w500),
                              color: Colors.white,
                              context: context,
                              actions: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () => screenLock<void>(
                                        context: context,
                                        correctString: '123456',
                                        customizedButtonChild: const Icon(
                                          Icons.fingerprint,
                                        ),
                                        customizedButtonTap: () async {
                                          await localAuth(context);
                                        },
                                        didOpened: () async {
                                          await localAuth(context);
                                        },
                                      ),
                                      icon: Icon(Iconsax.scan, size: 40, color: Colors.blue.shade700)),
                                        Text('QR Code', style: TextStyle(fontSize: 15.0, color: Colors.black,))
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ContactPage()),
                                          );
                                        }, icon: Icon(Iconsax.hashtag_up, size: 40, color: Colors.blue.shade700)),
                                        Text('User Tag', style: TextStyle(fontSize: 15.0, color: Colors.black,))
                                      ],
                                    ),
                                  ],
                                ),
                                
                              ]
                            );
                          }
                        },
                        color: Color.fromRGBO(13, 41, 70, 1),
                        child: Text(
                          "Send",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }

  static List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, -1, 0, -1];
}
