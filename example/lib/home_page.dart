import 'package:broadcaster/broadcaster.dart';
import 'package:flutter/material.dart';
import 'home_broadcaster.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BroadcasterProvider(
        creator: (context) => HomeBroadcaster(),
        builder: (context, broadcaster) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Broadcaster Lib'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<int>(
                      stream: broadcaster.countBroadcast.stream,
                      builder: (context, snapshot) {
                        final count = snapshot.data ?? 0;
                        return Text('counter: $count');
                      })
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                broadcaster.increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
