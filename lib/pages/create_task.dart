import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: Text("Create a Task", style: TextStyle(fontFamily: "Rubik",
        color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24.0)),
      )
    );
  }
}
