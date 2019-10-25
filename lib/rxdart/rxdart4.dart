import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class Rxdart4 extends StatelessWidget {
  const Rxdart4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Rxdart4"),
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
  
  PublishSubject<String> _textSubject;


  @override
  void dispose() {
     //不再需要的subject需要关掉
    _textSubject.close();
    super.dispose();
   
       
  }

  @override
  void initState() { 
    super.initState();
    
  
        _textSubject = PublishSubject<String>();
        
        _textSubject.listen((data) => print(data));
           
        
      }
        
        
        @override
        Widget build(BuildContext context) {
          return Column(
            children: <Widget>[
              Theme(
                  
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.black
                  ),
                  child: TextField(
                    onChanged: (value){
                      _textSubject.add("input : $value");
                    },
                    onSubmitted: (value){
                      _textSubject.add("submit : $value");
                    },
                    decoration: InputDecoration(
                      labelText: "Title",
                      filled: true
                    ),
                  ),
              ),
             
            ],
          );
        }
      }
      
     



  
  
  