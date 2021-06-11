import 'dart:async';

class CounterBloc {
  int counter = 0;
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counterr => _counterStateController.stream;
  final _counterEventController = StreamController<int>();
  Sink<int> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(increment);
    // _counterEventController.stream.listen(decrement);
    // _counterEventController.stream.listen(_mapEventToState);
  }

  // void _mapEventToState(CounterEvent event) {
  //   if (event is IncrementEvent)
  //     _counter++;
  //   else
  //     _counter--;
  //   _inCounter.add(_counter);
  // }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }

  Future<int> increment(int _counter) async {
    print(_counter);
    _counter++;
    print(_counter);
    _inCounter.add(_counter);
    return _counter;
  }

  // Future<int> decrement(int _counter) async {
  //   _counter--;
  //   return _counter;
  // }
}
