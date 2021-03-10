import 'package:flutter/material.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  final title;

  TopBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '${this.title}',
        // style: TextStyle(color: Color.fromRGBO(200, 200, 200, 1)),
      ),
      // toolbarOpacity: 1,
      // backgroundColor: Colors.red,

      // 高度调整
      // elevation: 1,
      // toolbarHeight: 200,
    );
  }

  @override
  // 高度调整
  // Size get preferredSize => Size.fromHeight(0);
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
