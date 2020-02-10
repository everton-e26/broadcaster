import 'broadcast.dart';
import 'ibroadcast.dart';

abstract class Broadcaster<T> {
  final Map<T, IBroadcast> _broadcasts = {};

  IBroadcast<TValue> broadcast<TValue>(T key, {TValue initialValue}) {
    if (_broadcasts.containsKey(key)) {
      return _broadcasts[key];
    }
    final broadcast = Broadcast<TValue>(initialValue: initialValue);
    _broadcasts[key] = broadcast;
    return broadcast;
  }

  endTransmission() {
    _broadcasts.forEach((key, b) {
      b.endTransmission();
    });
  }
}
