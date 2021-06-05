import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/drawer.widget.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Home"),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home Page",style:Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }


}