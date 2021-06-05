import 'package:flutter/material.dart';
import 'package:flutter_app/global/global.parameter.dart';
import 'package:flutter_app/widgets/drawer.item.widget.dart';

import 'drawer.header.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MyDrawerHeader(),
          ...(GlobalParameters.menus).map((item) =>
            MyDrawerItem(item['title'].toString(), item['route'].toString(), item['icon'] as Icon
            )
          )
        ],
      ),
    );
  }
}
