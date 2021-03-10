import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() {
    return _OverviewState();
  }
}

class _OverviewState extends State<Overview> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _didMount(context));
  }

  _didMount(context) {
    Navigator.of(context).pushNamed("/choose-entry");
  }

  @override
  Widget build(BuildContext context) {
    return new Center(child: Text('overview'));
  }
}
