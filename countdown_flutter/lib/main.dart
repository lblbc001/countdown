import 'package:flutter/material.dart';

/// 厦门大学计算机专业 | 前华为工程师
/// 分享编程技术，没啥深度，但看得懂，适合初学者。
/// Java | 安卓 | 前端 | Flutter | 小程序 | 鸿蒙
/// 公众号：花生皮编程
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '花生皮编程',
      home: Scaffold(
        appBar: AppBar(
          title: Text('花生皮编程'),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: const <Widget>[Text("hahaha")],
            ),
          ),
        ),
      ),
    );
  }
}
