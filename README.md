# Broadcaster

A simple state management for flutter
<br/><br/>

## Getting started

You should ensure that you add the broadcaster as a dependency in your flutter project.

read more at [how to install](https://pub.dev/packages/broadcaster#-installing-tab-)

## Usage

A counter app with Broadcaster

```dart

class HomePageBroadcaster extends Broadcaster<_BroadcastKeys> {
  // define the broadcast passing a required key and an initital value
  Broadcast<int> get countBroadcast =>
      this.broadcast<int>(_BroadcastKeys.count, initialValue: 0);

  // the increment action
  increment() {
    countBroadcast.value += 1;
  }
}

/// Enum used as the key to broadcasts
enum _BroadcastKeys { count }

```

Screen Widget

```dart
import 'package:broadcaster/broadcaster.dart';
import 'package:flutter/material.dart';
import 'home_page_broadcaster.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // wrap the page with the provider
    return BroadcasterProvider(
        // creator param
        creator: (context) => HomePageBroadcaster(),
        // builder param with the broadcaster instance
        builder: (context, broadcaster) {
          return Scaffold(
            body: Center(
              // StreamBuilder to consume the stream provided by the broadcast
              child: StreamBuilder<int>(
                  // pass here the broadcast stream
                  stream: broadcaster.countBroadcast.stream,
                  builder: (context, snapshot) {
                    final count = snapshot.data ?? 0;
                    return Text('counter: $count');
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // call the broadcaster increment action
                broadcaster.increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        });
  }
}

```

checkout app source at [github](https://github.com/everton-e26/broadcaster/blob/master/example/lib/home_broadcaster.dart)
