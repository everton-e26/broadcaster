import 'broadcast.dart';
import 'ibroadcast.dart';

abstract class BroadcasterController {
  final Map<dynamic, IBroadcast> _broadcasts = {};

  IBroadcast<T> broadcast<T>(dynamic key) {
    if (_broadcasts.containsKey(key)) {
      return _broadcasts[key];
    }
    final broadcast = Broadcast<T>();
    _broadcasts[key] = broadcast;
    return broadcast;
  }
}
