import 'package:flutter/material.dart';
import 'package:flutter_tmac/stream/stream1.dart';
import 'package:flutter_tmac/stream/stream2.dart';
import 'package:flutter_tmac/stream/stream3.dart';

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
            ListTileW("Stream学习系列1", "这个看看", Stream1()),
            ListTileW("Stream学习系列2", "这个看看", Stream2()),
            ListTileW("Stream学习系列3", "这个看看", Stream3()),
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
