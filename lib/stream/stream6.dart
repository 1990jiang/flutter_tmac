import 'dart:async';

import 'package:flutter/material.dart';

class Stream6 extends StatelessWidget {
  const Stream6({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Stream6"),
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
  StreamController<String> _streamController;
  StreamSink _streamSink;
  String _data = "暂无数据";

  @override
  void dispose() {
    //不再需要的StreamController需要移除一下
    _streamController.close();
    super.dispose();
   

  }
  
  @override
  void initState() { 
    super.initState();
    //多次监听-
    _streamController = StreamController.broadcast();
    _streamSink = _streamController.sink;
    _streamSubscription =  _streamController.stream.listen(onData,onError: onError,onDone: onDone);
    //再用streamController监听一个请求
    _streamController.stream.listen(onDataTwo);
  }

  //数据加载成功
  void onData(String data){
    //收到数据后，给页面UI赋值
    setState(() {
       _data = data;
    });
    print("$data");
  }
  //第二个监听方法
  void onDataTwo(String data){
     print("onDataTwo: $data");
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
 //点击添加按钮，才取请求数据
 void _addDataToStream() async{
     print("Add data to stream");
     String data = await fetchData();
     //请求到的数据通过这个streamController添加到stream中，然后再通过监听方法中的onData方法显示出数据来
     //_streamController.add(data);

     //用StreamSink来添加数据
     _streamSink.add(data);
 }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text(_data),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     FlatButton(
                        child: Text("Add"),
                        onPressed: _addDataToStream,
                     ),
                     FlatButton(
                        child: Text("pasue"),
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
             ],
           ),
        ),
    );
  }
}