import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class Rxdart5 extends StatelessWidget {
  const Rxdart5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Rxdart5"),
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
        
        _textSubject
        //添加这个的意思就是当文本框输入结束后我过0.5秒显示值
        //这个就可以用在那种文本框输入然后随着用户输入马上要用文本框的值去请求内容的那种。
        //这样不用每输入一个字符都去请求数据
        .debounceTime(Duration(milliseconds:500))
        .listen((data) => print(data));
           
        
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
      
     



  
  
  