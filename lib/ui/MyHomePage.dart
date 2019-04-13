import 'package:flutter/material.dart';
import './weather.dart';
import '../model/weather_data.dart';
import '../api/map_api.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData _weatherData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Wheater App'),
      ),
      body: _weatherData != null
          ? Weather(weatherData: _weatherData)
          : Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
    );
  }

  getCurrentLocation() {
    loadWeather(lat: 40.71, lon: -74.01);
  }

  loadWeather({double lat, double lon}) async {
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat, lon: lon);
    setState(() {
      this._weatherData = data;
    });
  }
}
