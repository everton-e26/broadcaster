import 'package:broadcaster/broadcaster.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

extension BuildContextExtensios on BuildContext {
  /// Retrieve a instance of required Broadcaster
  T broadcasterOf<T extends Broadcaster>() {
    return Provider.of<T>(this);
  }
}
