import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class Rxdart3 extends StatelessWidget {
  const Rxdart3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Rxdart3"),
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
    
  //   //(第四种)根据一个简单值创建
  //   //Observable<String> _observable = Observable.just("hello hh");

  //   //(第五种)时间间隔重复创建的(index就是重复的次数)
  //  Observable<String> _observable = Observable.periodic(Duration(seconds: 3),(index) => index.toString());
    
    
  //   _observable.listen(print);
       PublishSubject<String> _publishSubject = PublishSubject<String>();
       _publishSubject.listen((data) => print("listen 1 : $data"));
       _publishSubject.add("hello");
        _publishSubject.listen((data) => print("listen 2 : ${data.toUpperCase()}"));
        _publishSubject.add("tmac");
        _publishSubject.close();

        //整个的结果是:hello TMAC tmac
        //公共监听方法，首先创建了一个监听listen1,那么当将hello add到subject的时候，listen1就可以获得这个data值
        //也就是hello的值。 当我们再添加listen2的时候，传入tmac就会被listen1和listen2同时捕获到

        
      
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
      
     



  
  
  