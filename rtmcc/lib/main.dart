import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:rtmcc/core/network_connectivity.dart';

import 'pages/_test/main.dart';
import 'pages/overview/main.dart';
import 'pages/choose-entry/main.dart';
import 'pages/web-configure/main.dart';
import 'pages/webpage/main.dart';
import 'pages/home/main.dart';

void main() {
  runApp(new Main());
}

// permission_handler 权限申请主函数
Future<void> requestPermission(Permission permission) async {
  // final status = await permission.request();
  // print(status);
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checkoutNetConnection();

    // 本地数据访问权限申请
    requestPermission(Permission.notification);

    return new MaterialApp(initialRoute: "/choose-entry", routes: {
      '/_test': (context) => Test(),
      '/overview': (context) => Overview(),
      '/choose-entry': (context) => ChooseEntry(),
      '/web-configure': (context) => WebConfigure(),
      '/webpage': (context) => WebPage(),
      '/home': (context) => Home(),
    });
  }
}
