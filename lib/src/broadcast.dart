import 'package:rxdart/rxdart.dart';
import 'ibroadcast.dart';

class Broadcast<T> implements IBroadcast<T> {
  Broadcast({T initialValue}) {
    _streamController = BehaviorSubject<T>.seeded(initialValue);
  }
  BehaviorSubject<T> _streamController;

  /// Expose the stream of this broadcast
  Stream<T> get stream => _streamController.stream;

  /// Expose the current value of the broadcast
  T get value => _streamController.value;

  set value(T v) => _streamController.add(v);

  endTransmission() {
    _streamController.close();
  }
}
