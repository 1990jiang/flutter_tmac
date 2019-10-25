import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class Rxdart2 extends StatelessWidget {
  const Rxdart2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Rxdart2"),
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
  void dispose() {
    
    super.dispose();
  }

  @override
  void initState() { 
    super.initState();
    //第一种
    //Observable<String> _observable = Observable(Stream.fromIterable(["hello","您好"]));
    
    


    //（第二种）.fromFuture创建Observable
   // Observable<String> _observable = Observable.fromFuture(Future.value("hello"));
    
    //（第三种）通过fromIterable创建Observable，根据一个迭代的类别创建
    //Observable<String> _observable = Observable.fromIterable(["hello","tmac","kobe"]);
    
    //(第四种)根据一个简单值创建
    //Observable<String> _observable = Observable.just("hello hh");

    //(第五种)时间间隔重复创建的(index就是重复的次数)
   Observable<String> _observable = Observable.periodic(Duration(seconds: 3),(index) => index.toString());
    
    
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


  
  
  