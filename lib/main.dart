import 'package:flutter/material.dart';
import 'package:flutter_tmac/rxdart/rxdart1.dart';
import 'package:flutter_tmac/rxdart/rxdart2.dart';
import 'package:flutter_tmac/rxdart/rxdart3.dart';
import 'package:flutter_tmac/stream/stream1.dart';
import 'package:flutter_tmac/stream/stream2.dart';
import 'package:flutter_tmac/stream/stream3.dart';
import 'package:flutter_tmac/stream/stream4.dart';
import 'package:flutter_tmac/stream/stream5.dart';
import 'package:flutter_tmac/stream/stream6.dart';
import 'package:flutter_tmac/stream/stream7.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tmac")),
        body: ListView(
          children: <Widget>[
            ListTileW("Stream学习系列1-Stream初体验", "这个看看", Stream1()),
            ListTileW("Stream学习系列2-Stream监听方法", "这个看看", Stream2()),
            ListTileW("Stream学习系列3-StreamSubscription", "这个看看", Stream3()),
            ListTileW("Stream学习系列4-StreamController", "这个看看", Stream4()),
            ListTileW("Stream学习系列5-StreamSink", "这个看看", Stream5()),
            ListTileW("Stream学习系列6-StreamController-多次监听", "这个看看", Stream6()),
            ListTileW("Stream学习系列7--StreamBuilder运用", "这个看看", Stream7()),
            ListTileW("Rxdart学习系列--Rxdart初体验", "这个看看", Rxdart1()),
            ListTileW("Rxdart学习系列--创建Observable的几种方法", "这个看看", Rxdart2()),
            ListTileW("Rxdart学习系列--subjects控制Observable", "这个看看", Rxdart3()),
          ],
        ));
  }
}

class ListTileW extends StatelessWidget {
  const ListTileW(this.title, this.subTitle, this.pushWidget);
  final String title;
  final String subTitle;
  final Widget pushWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pushWidget;
        }));
      },
    );
  }
}
