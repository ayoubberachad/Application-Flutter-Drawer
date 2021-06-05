import 'package:flutter/material.dart';

class MyDrawerItem extends StatelessWidget {

  String title;
  String route;
  Icon icon;

  MyDrawerItem(this.title,this.route,this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
        },
      leading:icon,
      trailing: Icon(Icons.arrow_right,color: Colors.orange,),
      title: Text(title,style: TextStyle(fontSize: 20,color: Colors.orange)),
    );

  }
}
