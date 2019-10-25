import 'dart:async';

import 'package:flutter/material.dart';

class Stream3 extends StatelessWidget {
  const Stream3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Stream3"),
       ),
       body:StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;

  @override
  void initState() { 
    super.initState();
    //初始化一个Stream对象，然后调用fromFuture方法，方法里面放请求数据方法
    
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    
    //监听stream会返回一个StreamSubscription对象，
    //通过这个对象可以控制这个监听的开始，结束，暂停等
    _streamSubscription =  _streamDemo.listen(onData,onError: onError,onDone: onDone);
    
  }

  //数据加载成功
  void onData(String data){
    print("$data");
  }
  //数据加载失败
  void onError(error){
    print("Error : $error");
  }
  //数据加载完成
  void onDone(){
    print("数据加载完成");
  }
  //请求数据方法
  Future<String> fetchData() async {
  
    await Future.delayed(Duration(seconds:5));
    //返回String数据给Future
    return "hello world";
  }
  
  //操作stream的监听_streamSubscription对象
  void _pauseStream(){
      //暂定监听--可以通过恢复监听
      _streamSubscription.pause();
  }
  void _resumeStream(){
     //恢复监听
     _streamSubscription.resume();
  }
  void _cancelStream(){
    //删除监听(删除监听后不能恢复)
     _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
           child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 FlatButton(
                    child: Text("pause"),
                    onPressed: _pauseStream,
                 ),
                 FlatButton(
                    child: Text("Resume"),
                    onPressed: _resumeStream,
                 ),
                 FlatButton(
                    child: Text("cancel"),
                    onPressed: _cancelStream,
                 )
              ],
           ),
        ),
    );
  }
}