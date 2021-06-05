import 'package:flutter/material.dart';

class GlobalParameters{
  static final menus=[
    {
      "title":"Home",
      "route":"/",
      "icon":Icon(Icons.home)
    },
    {
      "title":"Counter",
      "route":"/counter",
      "icon":Icon(Icons.add_box_rounded)
    },
    {
      "title":"Users",
      "route":"/users",
      "icon":Icon(Icons.contacts)
    },
    {
      "title":"Whether",
      "route":"/whether",
      "icon":Icon(Icons.wb_sunny)
    },
    {
      "title":"Gallery",
      "route":"/gallery",
      "icon":Icon(Icons.image_rounded)
    }

  ];
}