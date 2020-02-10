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
            appBar: AppBar(
              title: Text('Broadcaster'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // StreamBuilder to consume the stream provided by the broadcast
                  StreamBuilder<int>(
                      // pass here the broadcast stream
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
