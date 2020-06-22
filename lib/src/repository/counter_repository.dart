class CounterRepository {
  int _counter = 0;

  static CounterRepository _instance = CounterRepository._internal();

  CounterRepository._internal();

  factory CounterRepository() {
    return _instance;
  }

  int get() {
    return _counter;
  }

  void increment() {
    _counter++;
  }

  void clear() {
    _counter = 0;
  }
}
