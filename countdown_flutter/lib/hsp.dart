import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sprintf/sprintf.dart';

/// 厦门大学计算机专业 | 前华为工程师
/// 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
/// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
/// 公众号：花生皮编程
void main() {
  runApp(const HspApp());
}

class HspApp extends StatelessWidget {
  const HspApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '花生皮编程',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '倒计时-花生皮编程'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final interval = const Duration(milliseconds: 1000);
  var timer;
  var isStarted = false;
  var remainingSeconds = 10;

  void startTimer() {
    timer = Timer.periodic(interval, (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          stopTimer();
          Fluttertoast.showToast(msg: "时间到啦！");
        }
      });
    });
    setState(() {
      isStarted = true;
    });
  }

  void stopTimer() {
    timer.cancel();
    setState(() {
      isStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(getTimeString(remainingSeconds)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextButton(10),
                buildTextButton(30),
                buildTextButton(60),
              ],
            ),
            IconButton(
              iconSize: 50,
              icon: buildClickButton(),
              onPressed: () {
                if (isStarted) {
                  stopTimer();
                } else {
                  startTimer();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  TextButton buildTextButton(int seconds) {
    return TextButton(
      onPressed: () {
        addSeconds(seconds);
      },
      child: Text('+$seconds秒'),
    );
  }

  Icon buildClickButton() {
    if (isStarted) {
      return const Icon(Icons.pause_circle, color: Colors.blue);
    } else {
      return const Icon(Icons.play_circle, color: Colors.blue);
    }
  }

  void addSeconds(int seconds) {
    setState(() {
      remainingSeconds += seconds;
    });
  }

  getTimeString(int totalSeconds) {
    var hours = totalSeconds ~/ 3600;
    var minutes = totalSeconds ~/ 60 % 60;
    var seconds = totalSeconds % 60;
    return sprintf('%2.2d:%2.2d:%2.2d', [hours, minutes, seconds]);
  }
}
