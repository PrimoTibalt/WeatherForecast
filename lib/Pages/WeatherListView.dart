import 'package:flutter/material.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';

class WeatherListView extends StatelessWidget {
  final List<WeatherModel> listOfWeather;

  WeatherListView(this.listOfWeather);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.listOfWeather.length,
      itemBuilder: (context, index) {
        return Text(
          this.listOfWeather[index].data.temp.toString(),
        );
      },
    );
  }
}
