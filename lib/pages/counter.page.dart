import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/drawer.widget.dart';

class CounterPage extends StatefulWidget{
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:MyDrawer(),
      appBar: AppBar(title: Text("CounterHome"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "value: $counter",style:Theme.of(context).textTheme.bodyText2,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.green,
              child:Text("Plus",style: TextStyle(color: Colors.white)), onPressed: (){
              setState(() {
                ++counter;
              });
            },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.green,
              child:Text("Minus",style: TextStyle(color: Colors.white)), onPressed: (){
              setState(() {
                --counter;
              });
            },
            ),

          ],
        ),
      ),
    );
  }
}