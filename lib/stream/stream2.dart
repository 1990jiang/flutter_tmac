import 'package:flutter/material.dart';

class Stream2 extends StatelessWidget {
  const Stream2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Stream2"),
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
  
  @override
  void initState() { 
    super.initState();
    //初始化一个Stream对象，然后调用fromFuture方法，方法里面放请求数据方法
    print("create a stream");
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print("Start listening on a stream");
    _streamDemo.listen(onData,onError: onError,onDone: onDone);
    print("Initialize stream listem");
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
    //模拟数据请求，延时3秒执行
    await Future.delayed(Duration(seconds:3));
    //返回String数据给Future
    return "hello world";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
           child: Text("Stream"),
        ),
    );
  }
}