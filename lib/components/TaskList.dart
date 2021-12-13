import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timepad/models/TaskModel.dart';
import 'package:timepad/models/TimePadIcon.dart';
import 'package:timepad/pages/task_details.dart';

class TaskList extends StatefulWidget {
  final TaskModel taskModel;
  const TaskList({Key? key, required this.taskModel}) : super(key: key);
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Timer? _timer;

  bool isCountdown = true;

  Duration duration = Duration();

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

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: ListTile(
        tileColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        title: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TaskDetail(taskModel: widget.taskModel))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TaskDetail(taskModel: widget.taskModel))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.taskModel.title,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${hours}:${minutes}:${seconds}",
                      style: TextStyle(fontSize: 12.0, fontFamily: "Rubik"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                  children: widget.taskModel.tags
                      .map(
                        (tag) => new Card(
                            margin: EdgeInsets.only(right: 4.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 5.0),
                              child: Text(
                                tag,
                                style: TextStyle(
                                    fontSize: 12.0, fontFamily: "Rubik"),
                              ),
                            )),
                      )
                      .toList()
                  // ],
                  ),
            ),
            isRunning == false || isCompleted
                ? InkWell(
                    onTap: () {
                      if (isRunning == false) {
                        startTimer(resets: false);
                        widget.taskModel.status == "active";
                      }
                    },
                    child: Icon(
                      TimePadIcon.play,
                      color: Color.fromRGBO(130, 130, 130, 1),
                    ))
                : InkWell(
                    onTap: () {
                      if (isRunning == true) {
                        stopTimer(resets: false);
                        widget.taskModel.status == "inactive";
                      }
                    },
                    child: Icon(
                      TimePadIcon.pause,
                      color: Color.fromRGBO(130, 130, 130, 1),
                    )),
          ],
        ),
        leading: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TaskDetail(taskModel: widget.taskModel))),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: widget.taskModel.color,
            child: Icon(
              widget.taskModel.icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  
  @override
  void dispose() {
    super.dispose();
  }
}
