import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartstop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMicroseconds;
    String milliseconds = (milli % 100).toString().padLeft(3, '0');
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, '0');
    String minutes = ((milli ~/ 1000) / 60).toString().padLeft(2, '0');
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initstate() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(
      Duration(microseconds: 30),
      (Timer) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {
                handleStartstop();
              },
              child: Center(
                  child: Container(
                alignment: Alignment.center,
                height: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 4)),
                child: Text(
                  returnFormattedText(),
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
            ),
            Container(
                child: CupertinoButton(
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onPressed: (() {
                      stopwatch.reset();
                    })))
          ],
        ),
      ),
    );
  }
}
