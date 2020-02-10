import 'package:broadcaster/broadcaster.dart';

enum _BroadcastKeys { count }

class HomeBroadcaster extends Broadcaster<_BroadcastKeys> {
  Broadcast<int> get countBroadcast =>
      this.broadcast<int>(_BroadcastKeys.count, initialValue: 0);

  increment() {
    countBroadcast.value += 1;
  }
}
