import 'package:flutter/material.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';
import 'package:weather/Services/WeatherRowService.dart';

class WeatherListView extends StatelessWidget {
  final List<WeatherModel> listOfWeather;

  WeatherListView(this.listOfWeather);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.listOfWeather.length,
      itemBuilder: (context, index) {
        return Semantics(
            button: false,
            focusable: true,
            child: Padding(
              child: WeatherRowService(this.listOfWeather[index], context)
                  .getRow(),
              padding: EdgeInsets.all(20),
            ));
      },
    );
  }
}
