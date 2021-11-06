import 'package:animate_do/animate_do.dart';
import 'package:intl/intl.dart';
import 'package:wrizt/pages/qr_code.dart';
import 'package:wrizt/pages/send_money.dart';
import 'package:wrizt/pages/single_transaction.dart';
import 'package:wrizt/pages/statement.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'account.dart';
import 'activity.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<dynamic> _transactions = [
    {
      'type': 'You Sent',
      'user': 'Celebritydeveloper',
      'amount': '450',
      'avatar': 'assets/images/avatar-1.png',
      'time': '6:25am'
    },
    {
      'type': 'You Recieved',
      'user': 'Axeboy',
      'amount': '920',
      'avatar': 'assets/images/avatar-2.png',
      'time': '5:50am'
    },
    {
      'type': 'You Funded',
      'user': 'chrisjumbo',
      'amount': '390',
      'avatar': 'assets/images/avatar-3.png',
      'time': '13:20pm'
    },
    {
      'type': 'You Sent',
      'user': 'olorigirl',
      'amount': '80',
      'avatar': 'assets/images/avatar-4.png',
      'time': '11:15am'
    },
    {
      'type': 'You Funded',
      'user': 'Drake',
      'amount': '50',
      'avatar': 'assets/images/avatar-5.png',
      'time': '08:09am'
    },
    {
      'type': 'You Sent',
      'user': 'bestie',
      'amount': '150',
      'avatar': 'assets/images/avatar-6.png',
      'time': '16:39am'
    },
    {
      'type': 'You Funded',
      'user': 'Ekong',
      'amount': '450',
      'avatar': 'assets/images/avatar-1.png',
      'time': '6:25am'
    },
    {
      'type': 'You Recieved',
      'user': 'vector',
      'amount': '920',
      'avatar': 'assets/images/avatar-2.png',
      'time': '5:50am'
    },
    {
      'type': 'You Sent',
      'user': 'spongbob',
      'amount': '390',
      'avatar': 'assets/images/avatar-3.png',
      'time': '13:20pm'
    },
    {
      'type': 'You Recieved',
      'user': 'blaza',
      'amount': '80',
      'avatar': 'assets/images/avatar-4.png',
      'time': '11:15am'
    },
    {
      'type': 'You Funded',
      'user': 'kolokodess',
      'amount': '50',
      'avatar': 'assets/images/avatar-5.png',
      'time': '08:09am'
    },
    {
      'type': 'You Sent',
      'user': 'thegod',
      'amount': '150',
      'avatar': 'assets/images/avatar-6.png',
      'time': '16:39am'
    },
  ];

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
        backgroundColor: Colors.transparent,
        elevation: 0,
          leading: IconButton(
            color: Colors.grey.shade700,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StatementScreen()));
            },
            icon: Icon(Iconsax.document, size: 30),
          ),
          actions: [
            IconButton(
              icon: Icon(Iconsax.filter, size: 30, color: Colors.grey.shade700),
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
                Text(
                  'Transactions',
                  style: TextStyle(
                    color: midNightBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: FadeInDown(
            duration: Duration(milliseconds: 500),
            child: Container(
              height: 40,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                  hintText: 'Search transactions',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            FadeInRight(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 15.0, top: 10.0),
                child: Text('Most Recent', style: TextStyle(fontSize: 16, color: Colors.grey.shade900, fontWeight: FontWeight.w500),),
              ),
            ),
            Container(
              height: 90,
              padding: EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: (index * 100) + 500),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => SendMoney(
                              name: _transactions[index]['user'], 
                              avatar: _transactions[index]['avatar']
                            )
                          )
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blueGrey[100],
                              backgroundImage: AssetImage(_transactions[index]['avatar']),
                            ),
                            SizedBox(height: 10,),
                            Text(_transactions[index]['user'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30,),
            FadeInRight(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
                child: Text('All Transactions', style: TextStyle(fontSize: 16, color: Colors.grey.shade900, fontWeight: FontWeight.w500),),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              padding: EdgeInsets.only(left: 15, right: 15, top: 30),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => SingleTransactionScreen(
                              name: _transactions[index]['user'],
                              amount: _transactions[index]['amount'],
                              type: _transactions[index]['type'],
                              time: _transactions[index]['time'],
                              avatar: _transactions[index]['avatar']
                            )
                          )
                        );
                      },
                    child: FadeInRightBig(
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(_transactions[index]['avatar'], width: 50, height: 50,),
                                //Image.network(_transactions[index][1], width: 50, height: 50,),
                                SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_transactions[index]['user'], style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w500, fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text(_transactions[index]['type'], style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(_formatNumber(_transactions[index]['amount']), style: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.w700),),
                                SizedBox(height: 5,),
                                Text(_transactions[index]['time'], style: TextStyle(color: Colors.grey.shade500, fontSize: 12,), textAlign: TextAlign.right,),],
                                ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]
        )
      )
    );
  }

  user(int index, double number) {
    index = number ~/ 60;
    return FadeInRight(
      delay: Duration(seconds: 1),
      duration: Duration(milliseconds: (index * 100) + 500),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => SendMoney(
                name: _transactions[index]['name'], 
                avatar: _transactions[index]['avatar']
              )
            )
          );
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: number / 60 * 5.2,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade100,
                  backgroundImage: AssetImage(_transactions[index]['avatar']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container circle(Color color, [double diameter = 50.0]) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
    ));
  }
}