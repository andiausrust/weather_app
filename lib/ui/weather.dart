import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_data.dart';

class Weather extends StatelessWidget {
  final WeatherData weatherData;
  Weather({@required this.weatherData});

  Widget build(BuildContext context) {
    final Widget dateSection = Container(
      child: Text(
        DateFormat('MMMM dd, H:mm').format(DateTime.now()),
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0),
      ),
    );

    final Widget tempSection = Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            weatherData.temp.toStringAsFixed(0),
            style: TextStyle(fontSize: 80.0),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12.0),
              margin: EdgeInsets.only(left: 6.0),
              child: Text(
                '\u2103',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Image.network(
              'https://openweathermap.org/img/w/${weatherData.icon}.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover),
        ],
      ),
    );

    final Widget descriptionSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          weatherData.name,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          weatherData.main,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        )
      ],
    ));

    return Container(
      padding: EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dateSection,
          tempSection,
          descriptionSection,
        ],
      ),
    );
  }
}