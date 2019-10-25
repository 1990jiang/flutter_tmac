import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class Rxdart1 extends StatelessWidget {
  const Rxdart1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Rxdart1"),
       ),
       body:RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  
  @override
  void initState() { 
    super.initState();
    //有点像OC里面的观察者模式
    //创建一个Observable对象，利用Stream对其初始化
    Observable<String> _observable = Observable(Stream.fromIterable(["hello","您好"]));
    //监听打印方法，打印出hello和您好字符串
    _observable.listen(print);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Text("Rxdart"),
        ),
    );
  }
}


  
  
  