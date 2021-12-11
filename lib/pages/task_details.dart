import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timepad/models/TaskModel.dart';
import 'package:timepad/models/TimePadIcon.dart';
import 'package:timepad/theme/constants.dart';

class TaskDetail extends StatefulWidget {
  final TaskModel taskModel;
  const TaskDetail({Key? key, required this.taskModel}) : super(key: key);

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  Timer? _timer;
  bool isCountdown = true;
  Duration duration = Duration();

  void reset() {
    if (isCountdown) {
      setState(() {
        widget.taskModel.time = widget.taskModel.time;
      });
    } else {
      setState(() {
        widget.taskModel.time = Duration();
      });
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;
    setState(() {
      final seconds = widget.taskModel.time.inSeconds + addSeconds;
      if (seconds < 0) {
        _timer?.cancel();
      } else {
        widget.taskModel.time = Duration(seconds: seconds);
      }
    });
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
    if (widget.taskModel.status == "inactive") {
      _timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    }
    if (resets) {
      reset();
    }
  }

  void initState() {
    super.initState();
    startTimer();
    reset();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(widget.taskModel.time.inHours);
    final minutes = twoDigits(widget.taskModel.time.inMinutes.remainder(60));
    final seconds = twoDigits(widget.taskModel.time.inSeconds.remainder(60));
    final isRunning = _timer == null ? false : _timer?.isActive;
    final isCompleted = widget.taskModel.time.inSeconds == 0;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(widget.taskModel.title,
              style: TextStyle(
                  fontFamily: "Rubik",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0)),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(widget.taskModel.tags[0],
                  style: TextStyle(
                      fontFamily: "Rubik",
                      color: pink,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0)),
            )
          ],
          brightness: Brightness.light,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      color: Color.fromRGBO(112, 18, 206, 1),
                      size: 20,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      widget.taskModel.title,
                      style: TextStyle(
                          color: Color.fromRGBO(7, 4, 23, 7),
                          fontFamily: "Rubik",
                          fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  height: 320,
                  child: Stack(fit: StackFit.expand, 
                  children: [
                    CircularProgressIndicator(
                      value: widget.taskModel.time.inSeconds.remainder(60) / 60,
                      valueColor: AlwaysStoppedAnimation(Color.fromRGBO(233, 233, 255, 1)),
                      strokeWidth: 15,
                      backgroundColor: purple),
                    Center(
                      child: Text("${hours}:${minutes}:${seconds}",
                        style: TextStyle(
                          color: Color.fromRGBO(7, 4, 23, 1),
                          fontFamily: "Rubik",
                          fontSize: 48.0,
                          fontWeight: FontWeight.w500)
                      ),
                    )
                    ]
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        if(isRunning == true) {
                          stopTimer(resets: false);
                          widget.taskModel.status == "inactive";
                        } else {
                          startTimer(resets: false);
                          widget.taskModel.status == "active";
                        }
                      },
                      child: isRunning == true ? Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromRGBO(233, 233, 255, 1),
                              radius: 30.0,
                              child: Icon(
                                TimePadIcon.pause,
                                color: Color.fromRGBO(189, 189, 189, 1),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                           Text(
                            "Pause",
                            style: TextStyle(
                                color: Color.fromRGBO(7, 4, 23, 7),
                                fontSize: 14.0,
                                fontFamily: "Rubik"),
                          ),
                        ],
                      ) : Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromRGBO(233, 233, 255, 1),
                              radius: 30.0,
                              child: Icon(
                                TimePadIcon.play,
                                color: Color.fromRGBO(189, 189, 189, 1),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                           Text(
                            "Play",
                            style: TextStyle(
                                color: Color.fromRGBO(7, 4, 23, 7),
                                fontSize: 14.0,
                                fontFamily: "Rubik"),
                          ),Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromRGBO(233, 233, 255, 1),
                              radius: 30.0,
                              child: Icon(
                                TimePadIcon.pause,
                                color: Color.fromRGBO(189, 189, 189, 1),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                           Text(
                            "Pause",
                            style: TextStyle(
                                color: Color.fromRGBO(7, 4, 23, 7),
                                fontSize: 14.0,
                                fontFamily: "Rubik"),
                          ),
                        ],
                      )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => stopTimer(resets: true),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Color.fromRGBO(233, 233, 255, 1),
                              radius: 30.0,
                              child: Icon(
                                TimePadIcon.top,
                                color: Color.fromRGBO(189, 189, 189, 1),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Quit",
                            style: TextStyle(
                                color: Color.fromRGBO(7, 4, 23, 7),
                                fontSize: 14.0,
                                fontFamily: "Rubik"),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
