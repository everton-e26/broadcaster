import 'package:rxdart/rxdart.dart';
import 'ibroadcast.dart';

class Broadcast<T> implements IBroadcast<T> {
  final BehaviorSubject<T> _streamController = BehaviorSubject<T>();

  Stream<T> get stream => _streamController.stream;

  T get value => _streamController.value;

  set value(T v) => _streamController.add(v);

  close() {
    _streamController.close();
  }
}
