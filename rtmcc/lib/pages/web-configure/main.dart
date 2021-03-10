import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum TypeValue { url_port, uri }

// Future<String> getValue(String string) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String result = prefs.getString(string) ?? "undefined";
//   return result;
// }

// void setValue(String string, String value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString(string, value);
// }

class WebConfigure extends StatefulWidget {
  @override
  _WebConfigureState createState() => _WebConfigureState();
}

class _WebConfigureState extends State<WebConfigure> {
  TypeValue _character = TypeValue.url_port;

  dynamic _url;
  String _port;
  String _uri;

  void initState() {
    super.initState();

    // 检测本地是否已有存储数据，如果有自动填写

    // 没有则拉倒
  }

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 2),
    () => 'Data Loaded',
  );

  Future<String> getValue(String string) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = prefs.getString(string) ?? "undefined";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: new FutureBuilder(
                future: getValue("url").then((_) => "_.toString()"),
                builder: (context, AsyncSnapshot snapshot) {
                  Widget hell;
                  if (snapshot.hasData) {
                    hell = Text('${snapshot.data}');
                  } else if (snapshot.hasError) {
                    hell = Text('${snapshot.error}');
                  } else {
                    hell = Text('awaiting...');
                  }

                  return new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // new Text('future'),
                      hell,
                      new ListTile(
                        title: const Text('url&port'),
                        leading: Radio(
                          value: TypeValue.url_port,
                          groupValue: _character,
                          onChanged: (TypeValue value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      new TextField(
                        enabled: _character == TypeValue.url_port,
                        onChanged: _saveUrl,
                      ),
                      new TextField(
                          enabled: _character == TypeValue.url_port,
                          onChanged: _savePort),
                      new ListTile(
                        title: const Text('uri'),
                        leading: Radio(
                          value: TypeValue.uri,
                          groupValue: _character,
                          onChanged: (TypeValue value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      new TextField(
                          enabled: _character == TypeValue.uri,
                          onChanged: _saveUri),
                      new Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: new ElevatedButton(
                          child: new Text('Get!'),
                          onPressed: _goToWebpage,
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: new ElevatedButton(
                          child: new Text('Set!'),
                          onPressed: _goToWebpage2,
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: new Text(
                            'Note: Everthing performs depend on server.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none)),
                      ),
                    ],
                  );
                })));
  }

  _saveUrl(value) {
    setState(() {
      _url = value;
    });
  }

  _savePort(value) {
    setState(() {
      _port = value;
    });
  }

  _saveUri(value) {
    setState(() {
      _uri = value;
    });
  }

  _goToWebpage() {
    // getValue('url');
  }

  _goToWebpage2() {
    // 判断是哪种模式
    if (_character == TypeValue.url_port) {
      print(_url);
      // setValue('url', _url);
      // setValue('port', _port);
      // Navigator.of(context).pushNamed("/webpage", arguments: "$_url:$_port");
    } else if (_character == TypeValue.uri) {
      // setValue('uri', _uri);
      // Navigator.of(context).pushNamed("/webpage", arguments: _uri);
    }

    // Navigator.of(context).pushNamed("/webpage");
  }
}
