import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: '花生皮编程'),
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
  int _counter = 0;
  var isCounting = false;
  var remainingSeconds = 60;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
            Text(remainingSeconds.toString()),
            Row(
              children: [
                buildTextButton(10),
                buildTextButton(30),
                buildTextButton(60),
              ],
            ),
            IconButton(
              iconSize: 50,
              icon: buildIcon(),
              onPressed: () {
                print("花生皮编程");
                setState(() {
                  // remainingSeconds++;
                  isCounting = !isCounting;
                });
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

  Icon buildIcon() {
    if (isCounting) {
      return const Icon(Icons.play_circle, color: Colors.blue);
    } else {
      return const Icon(Icons.pause_circle, color: Colors.blue);
    }
    // return Icon(
    //           // Icons.pause_circle,
    //           if(isCounting) {Icons.play_circle} else {Icons.pause_circle},
    //           color: Colors.blue,
    //         );
  }

  void addSeconds(int seconds) {
    remainingSeconds += seconds;
  }
}
