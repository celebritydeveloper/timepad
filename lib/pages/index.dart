import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timepad/components/TaskList.dart';
import 'package:timepad/models/TaskModel.dart';
import 'package:timepad/models/TimePadIcon.dart';
import 'package:timepad/theme/constants.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({
    Key? key,
  }) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<TaskModel> tasks = [];
  static const countdownDuration = Duration(minutes: 1, hours: 2);
  Timer? _timer;

  // int seconds = 10;
  // int minutes = 1;
  // int hours = 0;

  bool isCountdown = true;

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  Duration duration = Duration();

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = tasks[0].time.inSeconds + addSeconds;
      if (seconds < 0) {
        _timer?.cancel();
      } else {
        tasks[0].time = Duration(seconds: seconds);
      }
    });
  }

  void reset() {
    if (isCountdown) {
      setState(() {
        tasks[0].time = tasks[0].time;
      });
    } else {
      setState(() {
        tasks[0].time = Duration();
      });
    }
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() {
      _timer?.cancel();
    });
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void initState() {
    super.initState();
    tasks = [
      TaskModel(purple, TimePadIcon.monitor, "Watch Squid Game",
          ["Korean", "Games"], Duration(minutes: 30, hours: 2), "inactive"),
      TaskModel(orange, TimePadIcon.barbell, "Chest workout",
          ["Chest", "Shoulders",], Duration(minutes: 15, hours: 5), "inactive"),
      TaskModel(pink, TimePadIcon.code, "Code Facebook Landing Page", ["HTML", "CSS", "Frontend"],
          Duration(minutes: 20, hours: 22), "inactive"),
      TaskModel(green, TimePadIcon.book, "API Developement",
          ["Backend", "Node JS", "Express"], Duration(minutes: 45, hours: 0), "inactive"),
      TaskModel(purple, TimePadIcon.monitor, "Spiderman Verse",
          ["Marvel", "Sci-Fi"], Duration(minutes: 23, hours: 1), "inactive"),
      TaskModel(orange, TimePadIcon.barbell, "Abdonimal Workout",
          ["Abs", "Workout",], Duration(minutes: 48, hours: 17), "inactive"),
      TaskModel(pink, TimePadIcon.code, "Design Timepad Settings", ["Android", "Flutter"],
          Duration(minutes: 19, hours: 93), "inactive"),
      TaskModel(green, TimePadIcon.book, "Basics of Programming",
          ["Computer Science", "Programming"], Duration(minutes: 50, hours: 8), "inactive"),
      TaskModel(purple, TimePadIcon.monitor, "Clifford The Big Red Dog",
          ["Netflix", "Comedy"], Duration(minutes: 34, hours: 6), "inactive"),
      TaskModel(orange, TimePadIcon.barbell, "Legs Workout",
          ["Legs", "Squats",], Duration(minutes: 7, hours: 11), "inactive"),
      TaskModel(pink, TimePadIcon.code, "Build a React JS Portfolio", ["Frontend", "React", "Javascript"],
          Duration(minutes: 59, hours: 17), "inactive"),
      TaskModel(green, TimePadIcon.book, "Introductory Science",
          ["Applied", "Science", "Chemistry"], Duration(minutes: 22, hours: 21), "inactive")
    ];

    //startTimer();
    reset();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(tasks[0].time.inHours);
    final minutes = twoDigits(tasks[0].time.inMinutes.remainder(60));
    final seconds = twoDigits(tasks[0].time.inSeconds.remainder(60));
    final isRunning = _timer == null ? false : _timer?.isActive;
    final isCompleted = tasks[0].time.inSeconds == 0;

    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 255, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Tasks",
              style: TextStyle(
                  color: darker, fontSize: 24.0, fontFamily: "Rubik")),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(TimePadIcon.more, size: 25.0, color: Color.fromRGBO(130, 130, 130, 1)))
          ],
          brightness: Brightness.light,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 140,
              margin: EdgeInsets.symmetric(horizontal: 17.0, vertical: 15.0),
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(7, 4, 23, 1),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${hours}:${minutes}:${seconds}",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: "Rubik"),
                      ),
                      Icon(
                        TimePadIcon.chevron_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color.fromRGBO(112, 18, 206, 1),
                        size: 20,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(tasks[0].title,
                        style:
                            TextStyle(color: Colors.white, fontFamily: "Rubik"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Today", style: TextStyle(
                    color: darker,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Rubik-Bold")),
                  Text("See All",style: TextStyle(
                    color: darker,
                    fontSize: 16.0,
                    fontFamily: "Rubik-Regular")),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      TaskList(taskModel: tasks[index],),
                ),
              ),
            )
          ],
        ));
  }
}
