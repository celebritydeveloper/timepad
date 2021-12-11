import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timepad/models/TimePadIcon.dart';
import 'package:timepad/theme/constants.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 255, 1),
        elevation: 0,
        title: Text("My Productivity", style: TextStyle(fontFamily: "Rubik",
        color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24.0)),
        centerTitle: true,
        brightness: Brightness.light,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17.0, vertical: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
                    margin: EdgeInsets.only(right: 8.0),
                    height: 152,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Icon(Icons.check, color: Colors.white),
                                ),
                                SizedBox(width: 12.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Task", style: TextStyle(fontSize: 16.0,
                                    color: Color.fromRGBO(7, 4, 23, 1), fontWeight: FontWeight.w400, fontFamily: "Rubik"),),
                                    Text("Completed", style: TextStyle(fontSize: 16.0,
                                    color: Color.fromRGBO(7, 4, 23, 1), fontWeight: FontWeight.w400, fontFamily: "Rubik"),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text("12", style: TextStyle(fontSize: 32.0,
                          color: Color.fromRGBO(7, 4, 23, 1), fontWeight: FontWeight.w500, fontFamily: "Rubik"),),
                      ],
                    )
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
                    margin: EdgeInsets.only(left: 8.0),
                    height: 152,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: blue,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Icon(TimePadIcon.stopwatch, color: Colors.white),
                                ),
                                SizedBox(width: 12.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Time", style: TextStyle(fontSize: 16.0,
                                    color: Color.fromRGBO(7, 4, 23, 1), fontWeight: FontWeight.w400, fontFamily: "Rubik"),),
                                    Text("Duration", style: TextStyle(fontSize: 16.0,
                                    color: Color.fromRGBO(7, 4, 23, 1), fontWeight: FontWeight.w400, fontFamily: "Rubik"),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text("1h 46m", style: TextStyle(fontSize: 32.0,
                          color: Color.fromRGBO(7, 4, 23, 1), fontWeight: FontWeight.w500, fontFamily: "Rubik"),),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
