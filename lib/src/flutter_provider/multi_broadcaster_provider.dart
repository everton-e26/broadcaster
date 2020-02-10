import 'package:broadcaster/broadcaster.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MultiBroadcasterProvider extends StatelessWidget {
  final List<BroadcasterCreator> creators;
  final Widget Function(BuildContext) builder;

  const MultiBroadcasterProvider({
    Key key,
    @required this.creators,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: creators.map((c) {
        return c.provider;
      }).toList(),
      child: Builder(builder: (context) => builder(context)),
    );
  }
}

class BroadcasterCreator<T extends Broadcaster> {
  final T Function(BuildContext) creator;

  BroadcasterCreator(this.creator);

  Provider<T> get provider => Provider<T>(
        create: (context) => creator(context),
        dispose: (context, broadcaster) => broadcaster.endTransmission(),
      );
}
