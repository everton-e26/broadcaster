import 'package:rxdart/subjects.dart';
import 'broadcast.dart';
import 'ibroadcast.dart';

abstract class Broadcaster<T> {
  final Map<T, IBroadcast> _broadcasts = {};

  final _endTransmissionSubject = PublishSubject();

  IBroadcast<TValue> broadcast<TValue>(T key, {TValue initialValue}) {
    if (_broadcasts.containsKey(key)) {
      return _broadcasts[key];
    }
    final broadcast = Broadcast<TValue>(initialValue: initialValue);
    _broadcasts[key] = broadcast;
    return broadcast;
  }

  void onEndTransmission(void Function() callback) {
    _endTransmissionSubject.listen((_) {
      callback();
    });
  }

  void endTransmission() {
    _broadcasts.forEach((key, b) {
      b.endTransmission();
    });
    _endTransmissionSubject.add(this);
    _endTransmissionSubject.close();
  }
}
