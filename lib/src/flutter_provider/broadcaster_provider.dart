import 'package:broadcaster/broadcaster.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BroadcasterProvider<T extends Broadcaster> extends StatelessWidget {
  final T Function(BuildContext) creator;
  final Widget Function(BuildContext, T) builder;

  const BroadcasterProvider({Key key, this.creator, this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      create: (context) => creator(context),
      dispose: (context, broadcaster) => broadcaster.endTransmission(),
      child: Builder(builder: (context) {
        final broadcaster = Provider.of<T>(context);
        return builder(context, broadcaster);
      }),
    );
  }
}
