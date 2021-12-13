import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timepad/models/TimePadIcon.dart';
import 'package:timepad/theme/constants.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> with SingleTickerProviderStateMixin {
  bool _isLoaded = false;
  int _currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }


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
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(text: "1",
                                style: TextStyle(color: Color.fromRGBO(7, 4, 23, 1), fontSize: 32.0, fontWeight: FontWeight.bold, fontFamily: "Rubik" ),
                                children: [
                                  TextSpan(text: "h", style: TextStyle(color: Color.fromRGBO(7, 4, 23, 1), fontSize: 20.0, fontWeight: FontWeight.w300, fontFamily: "Rubik" ))
                                ],
                                
                              ),
                              
                            ),

                            SizedBox(width: 10.0,),

                            RichText(
                              text: TextSpan(text: "46",
                                style: TextStyle(color: Color.fromRGBO(7, 4, 23, 1), fontSize: 32.0, fontWeight: FontWeight.bold ),
                                children: [
                                  TextSpan(text: "m", style: TextStyle(color: Color.fromRGBO(7, 4, 23, 1), fontSize: 20.0, fontWeight: FontWeight.w300 ))
                                ],
                                
                              ),
                              
                            ),
                          ],
                        ),
                        // Text("1h 46m", style: TextStyle(fontSize: 32.0,
                        //   color: Color.fromRGBO(7, 4, 23, 1), fontWeight: FontWeight.w500, fontFamily: "Rubik"),),
                      ],
                    )
                  ),
                ),          
              ],
            ),
          ),


          Container(
            height: 48,
            margin: EdgeInsets.symmetric(vertical: 15.0),
            padding: EdgeInsets.all(3.0),
            width: 250.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 255, 1),
              borderRadius: BorderRadius.circular(10.0,),
            ),
            child: TabBar(
              controller: _tabController,
                      // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0,),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Color.fromRGBO(7, 4, 23, 1),
              tabs: [
                Tab(text: 'Day',),
          
                Tab(text: 'Week',),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 15.0),
                  width: double.infinity,
                  height: 380,
                  child: LineChart(
                    mainData(),
                    swapAnimationDuration: Duration(milliseconds: 1000),
                    swapAnimationCurve: Curves.linear,
                  ),
                ),
          
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 15.0),
                  width: double.infinity,
                  height: 380,
                  child: LineChart(
                    mainData(),
                    swapAnimationDuration: Duration(milliseconds: 1000),
                    swapAnimationCurve: Curves.linear,
                  ),
                ), 
              ]
            ),
          ),

          
        ],
      )
    );
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a)
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1.6,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: const [3, 3],
            color: const Color(0xff37434d).withOpacity(0.2),
            strokeWidth: 2,
          );
        },
        drawVerticalLine: false
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(showTitles: false,
        reservedSize: 22,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff68737d),
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'Wed';
            case 4:
              return 'Thu';
            case 8:
              return 'Today';
            case 11:
              return 'Sat';

          }
          return '';
        },
        margin: 10,
      ),

      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff68737d),
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
        reservedSize: 25,
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '2h30m';
            case 4:
              return '2h0m';
            case 8:
              return '1h15m';
            case 11:
              return '4h5m';

          }
          return '';
        },
        
        margin: 10,
      ),
      ),
    

    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: _isLoaded ? [
          FlSpot(0, 3),
          FlSpot(2.4, 2),
          FlSpot(4.4, 3),
          FlSpot(6.4, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 4),
          FlSpot(11, 5),
        ] : [
          FlSpot(0, 0),
          FlSpot(2.4, 0),
          FlSpot(4.4, 0),
          FlSpot(6.4, 0),
          FlSpot(8, 0),
          FlSpot(9.5, 0),
          FlSpot(11, 0),
        ],

        isCurved: true,
        colors: gradientColors,
        barWidth: 2,
        dotData: FlDotData(
          show: false
        ),

        belowBarData: BarAreaData(
          show: true,
          gradientFrom: Offset(0, 0),
          gradientTo: Offset(0, 1),
          colors: [
            Color(0xff02d39a).withOpacity(0.1),
            Color(0xff02d39a).withOpacity(0),
          ]
        )

      )
      ]
    );
  }
}
