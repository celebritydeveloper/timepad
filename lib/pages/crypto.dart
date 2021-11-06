import 'package:wrizt/pages/crypto_detail.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import 'account.dart';
import 'activity.dart';
import 'qr_code.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
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
                Text(
                  'Crypto',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image.asset('assets/images/sally.jpg', height: 600.0),
              // Container(
              //   height: 60.0,
              //   width: 300.0,
              //   decoration: BoxDecoration(
              //     color: midNightBlue,
              //     borderRadius: BorderRadius.all(Radius.circular(30))),
              //   child: Center(
              //     child: Text('Coming Soon!', style: TextStyle(color: Colors.white, fontSize: 22.0)))
              // )
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text('Buy, sell and securely hold cryptocurrencies with Casham', style: TextStyle(color: midNightBlue, fontSize: 22.0, fontWeight: FontWeight.w500))
              ),
        
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text('See available cryptocurrencies', style: TextStyle(color: midNightBlue, fontSize: 18.0, fontWeight: FontWeight.w500))
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailWalletScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Container(
                                //   height: 60.0,
                                //   width: 60.0,
                                //   decoration: BoxDecoration(
                                //     color: midNightBlue,
                                //     borderRadius: BorderRadius.all(Radius.circular(30))),
                                //   child: Center(
                                //     child: Icon(Icons.confirmation_num, color: Colors.white, size: 45,))
                                // ),
                                SvgPicture.asset('assets/images/btc.svg', width: 55,),
                                SizedBox(width: 10.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Bitcoin', style: TextStyle(color: midNightBlue, fontSize: 16.0, fontWeight: FontWeight.w500)),
                                    Text('N300')
                                  ],
                                ),
                              ],
                            ),
                            Text('N300')
                          ],
                        ),
                      ),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/eth.svg', width: 55,),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ethereum', style: TextStyle(color: midNightBlue, fontSize: 16.0, fontWeight: FontWeight.w500)),
                                  Text('N300')
                                ],
                              ),
                            ],
                          ),
                          Text('N300')
                        ],
                      ),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/bch.svg', width: 55,),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bitcoin Cash', style: TextStyle(color: midNightBlue, fontSize: 16.0, fontWeight: FontWeight.w500)),
                                  Text('N300')
                                ],
                              ),
                            ],
                          ),
                          Text('N300')
                        ],
                      ),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/ltc.svg', width: 55,),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Litecoin', style: TextStyle(color: midNightBlue, fontSize: 16.0, fontWeight: FontWeight.w500)),
                                  Text('N300')
                                ],
                              ),
                            ],
                          ),
                          Text('N300')
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/doge.svg', width: 55,),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Litecoin', style: TextStyle(color: midNightBlue, fontSize: 16.0, fontWeight: FontWeight.w500)),
                                  Text('N300')
                                ],
                              ),
                            ],
                          ),
                          Text('N300')
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/dash.svg', width: 55,),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Litecoin', style: TextStyle(color: midNightBlue, fontSize: 16.0, fontWeight: FontWeight.w500)),
                                  Text('N300')
                                ],
                              ),
                            ],
                          ),
                          Text('N300')
                        ],
                      ),
                    )
                  ],
                ),
              ),
        
        
        
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Learn more about crypto', style: TextStyle(color: midNightBlue, fontSize: 19.0, fontWeight: FontWeight.w600)),
                          Text('This is talking all about cryptocurrencies and all the best things available to it.', 
                          style: TextStyle(color: midNightBlue, fontSize: 14.0,)),
                        ],
                      )
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: mainBlue,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('About Bitcoin', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
        
            ],
          ),
        ),
      )
    );
  }

  

}
