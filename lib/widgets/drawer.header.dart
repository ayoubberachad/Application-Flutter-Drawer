import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Colors.green,Colors.white
                ]
            )
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:AssetImage("images/logo_enset.png"),
              backgroundColor: Colors.transparent,
            ),
          ],
        )
    );
  }
}
