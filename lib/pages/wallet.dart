import 'package:animate_do/animate_do.dart';
import 'package:wrizt/pages/activity.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'account.dart';
import 'add_cash.dart';
import 'cash_out.dart';
import 'linked_cards.dart';
import 'qr_code.dart';
import 'withdrawal_account.dart';

// import 'account.dart';
// import 'change_pin.dart';

class BankingPage extends StatefulWidget {
  const BankingPage({Key? key}) : super(key: key);

  @override
  _BankingPageState createState() => _BankingPageState();
}

class _BankingPageState extends State<BankingPage> {
  String getCurrency() {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "NGN");
    return format.currencyName.toString();
  }

  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  final newText = '10000000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
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
                  'Wallet',
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
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: SafeArea(
              child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              FadeInDown(
                duration: Duration(milliseconds: 500),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '${getCurrency()}',
                        style: TextStyle(
                            color: midNightBlue,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '${_formatNumber(newText.replaceAll(',', ''))}',
                            style: TextStyle(
                                color: midNightBlue,
                                fontSize: 60.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                ),
              ),
              FadeInDown(
                duration: Duration(milliseconds: 500),
                child: Text('Cash Balance',
                    style: TextStyle(
                        color: mainGray,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 30.0),
              FadeInRight(
                duration: Duration(milliseconds: 500),
                child: Container(
                  margin: EdgeInsets.only(top: 45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 180, height: 55),
                        child: ElevatedButton(
                          child: Text('Add Money',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCashScreen()),
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
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 180, height: 55),
                        child: ElevatedButton(
                          child: Text(
                            'Withdraw',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CashOutScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            primary: midNightBlue,
                            onPrimary: midNightBlue,
                            onSurface: midNightBlue,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.0),
              FadeInRight(
                duration: Duration(milliseconds: 700),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Institution',
                        style: TextStyle(
                            color: midNightBlue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Account Number',
                        style: TextStyle(
                            color: midNightBlue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              FadeInRight(
                duration: Duration(milliseconds: 700),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kuda Bank',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('2005633656'),
                          IconButton(
                              onPressed: () {
                                Clipboard.setData(
                                        new ClipboardData(text: '2005633656'))
                                    .then((_) {
                                  final snackbar = SnackBar(
                                    content: Text('2005633656'),
                                    action: SnackBarAction(
                                        label: 'Copied!', onPressed: () {}),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                });
                              },
                              icon: Icon(
                                Icons.copy,
                                size: 15.0,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              FadeInRight(
                duration: Duration(milliseconds: 900),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LinkedCardPage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Icon(Icons.credit_card_outlined,
                                      color: Colors.black, size: 25.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Linked Cards',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Icon(Icons.chevron_right_outlined,
                                  color: Colors.black, size: 25.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 45.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BankAccountPage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Icon(Icons.account_balance_outlined,
                                      color: Colors.black, size: 25.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Withdrawal Account',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Icon(Icons.chevron_right_outlined,
                                  color: Colors.black, size: 25.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
