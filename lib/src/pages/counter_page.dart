import 'package:flutter/material.dart';
import 'package:flutter_demo/src/bloc/couter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter page'),
      ),
      body: _body(),
      floatingActionButton: _actions(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          _counter(),
        ],
      ),
    );
  }

  Widget _counter() {
    return StreamBuilder<Object>(
      stream: _bloc.counterStream,
      initialData: 0,
      builder: (context, snapshot) {
        return Text(
          '${snapshot.data}',
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _clearCounter(),
        SizedBox(
          width: 10,
        ),
        _incrementClearCounter(),
      ],
    );
  }

  Widget _clearCounter() {
    return FloatingActionButton(
      heroTag: 'clearCounter',
      onPressed: () => _bloc.sendEvent.add(ClearCounter()),
      tooltip: 'clear',
      child: Icon(Icons.clear),
    );
  }

  Widget _incrementClearCounter() {
    return FloatingActionButton(
      heroTag: 'incrementClearCounter',
      onPressed: () => _bloc.sendEvent.add(IncremenrCounter()),
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
