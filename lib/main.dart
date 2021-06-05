import 'package:flutter/material.dart';
import 'package:flutter_app/pages/counter.page.dart';
import 'package:flutter_app/pages/gallery.page.dart';
import 'package:flutter_app/pages/home.page.dart';
import 'package:flutter_app/pages/users.page.dart';
import 'package:flutter_app/pages/weather.page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context)=>HomePage(),
        "/counter":(context)=>CounterPage(),
        "/users":(context)=>UsersPage(),
        "/gallery":(context)=>Gallery(),
        "/whether":(context)=>WeatherForm()
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 30,color: Colors.green)
        )
      ),
    );
  }
}


  
  
