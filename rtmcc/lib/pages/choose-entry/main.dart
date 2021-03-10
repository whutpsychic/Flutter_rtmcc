import 'package:flutter/material.dart';

class ChooseEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: Center(
            child: (Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                color: Colors.blue,
                child:
                    Text("Web-Mobile", style: TextStyle(color: Colors.white)),
                onPressed: () => _navigateToWeb(context)),
            RaisedButton(
                color: Colors.blue,
                child: Text("Native-Mobile",
                    style: TextStyle(color: Colors.white)),
                onPressed: () => _navigateToNative(context))
          ],
        ))));
  }

  _navigateToWeb(context) {
    Navigator.of(context).pushNamed("/web-configure");
  }

  _navigateToNative(context) {
    Navigator.of(context).pushNamed("/home");
  }
}
