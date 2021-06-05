import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class WeatherDetails extends StatefulWidget {
  String city = "";
  WeatherDetails(this.city);
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<WeatherDetails> {
  late List<dynamic> weatherData = [];
  getData(url) {
    http.get(Uri.parse(url), headers: {'accept': 'application/json'}).then(
            (resp) {
          setState(() {
            weatherData = json.decode(resp.body)['list'];
          });
        }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    String url = 'https://samples.openweathermap.org/data/2.5/forecast?q=${widget.city}&appid=b6907d289e10d714a6e88b30761fae22';
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final f = new DateFormat('yyyy-MM-dd');
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.city}'),
          backgroundColor: Colors.green,
        ),
        body: (weatherData == null)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: weatherData == null ? 0 : weatherData.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'images/${weatherData[index]['weather'][0]['main'].toLowerCase()}.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "${f.format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt'] * 1000000))}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt'] * 1000000))} |${weatherData[index]['weather'][0]['main']}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${weatherData[index]['main']['temp'].round()} °C",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
