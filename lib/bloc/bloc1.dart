import 'package:flutter/material.dart';

import 'counterHome.dart';

class Bloc1 extends StatelessWidget {
  const Bloc1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
         appBar: AppBar(
           title: Text("Bloc模式"),//Bloc 缩写:Business Logic Component 业务逻辑组件
           //意思就是将所有的业务逻辑拿出来单独编写，和UI组件分离
         ),
         body: CounterHome(),
         floatingActionButton: CounterActionButton(),
      ),
    );
  }
}

