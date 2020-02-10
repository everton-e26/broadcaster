import 'package:broadcaster/broadcaster.dart';

/// Enum used as the key to broadcasts
enum _BroadcastKeys { count }

class HomePageBroadcaster extends Broadcaster<_BroadcastKeys> {
  // define the broadcast passing a required key and an initital value
  Broadcast<int> get countBroadcast =>
      this.broadcast<int>(_BroadcastKeys.count, initialValue: 0);

  // the increment action
  increment() {
    countBroadcast.value += 1;
  }
}
