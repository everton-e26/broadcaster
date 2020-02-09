import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BroadcasterProvider extends StatefulWidget {
  final Builder builder;

  const BroadcasterProvider({Key key, this.builder}) : super(key: key);

  @override
  _BroadcasterProviderState createState() => _BroadcasterProviderState();
}

class _BroadcasterProviderState extends State<BroadcasterProvider> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {},
    );
  }
}
