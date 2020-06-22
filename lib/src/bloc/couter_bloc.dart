import 'dart:async';

import 'package:flutter_demo/src/repository/counter_repository.dart';

class CounterBase {}

class IncremenrCounter extends CounterBase {}

class ClearCounter extends CounterBase {}

class CounterBloc {
  CounterRepository _repository = CounterRepository();
  StreamController<CounterBase> _input = StreamController();
  StreamController<int> _output = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink<CounterBase> get sendEvent => _input.sink;

  CounterBloc() {
    _input.stream.listen(_onEvent);
  }

  void dispose() {
    _input.close();
    _output.close();
  }

  void _onEvent(CounterBase event) {
    if (event is IncremenrCounter) {
      _repository.increment();
    } else {
      _repository.clear();
    }
    _output.add(_repository.get());
  }
}
