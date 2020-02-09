import 'package:broadcaster/src/broadcaster_controller.dart';
import 'package:flutter/widgets.dart';

class BroadcasterInstanceManager {
  final Map<dynamic, BroadcasterController> _controllers = {};

  T controllerOf<T extends BroadcasterController>(BuildContext context) {
    String type = T.toString();
    T controller;
    if (_controllers.containsKey(type)) {
      controller = _controllers[type];
    } else {}
  }
}
