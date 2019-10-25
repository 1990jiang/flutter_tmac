
import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
       child: ActionChip(
         label: Text("0"),
         onPressed: (){
           _counterBloc.log();
         },
       ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  const CounterActionButton({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    
    return FloatingActionButton(
       child: Icon(Icons.add),
       onPressed: (){
         _counterBloc.log();
       },
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child,this.bloc}) : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)as CounterProvider);
  }

  @override
  bool updateShouldNotify( CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  void log(){
    print("BLoC");
  }
}