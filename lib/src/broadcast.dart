import 'package:rxdart/rxdart.dart';
import 'ibroadcast.dart';

class Broadcast<T> implements IBroadcast<T> {
  Broadcast({T initialValue}) {
    _streamController = initialValue != null
        ? BehaviorSubject<T>.seeded(initialValue)
        : BehaviorSubject<T>();
  }
  BehaviorSubject<T> _streamController;

  Stream<T> get stream => _streamController.stream;

  T get value => _streamController.value;

  set value(T v) => _streamController.add(v);

  endTransmission() {
    _streamController.close();
  }
}
