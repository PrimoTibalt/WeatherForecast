import 'package:flutter/material.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';
import 'package:weather/Services/WeatherDayService.dart';

class WeatherListView extends StatelessWidget {
  final List<WeatherModel> listOfWeather;

  WeatherListView(this.listOfWeather);

  @override
  Widget build(BuildContext context) {
    var list = WeatherDayService(listOfWeather, context).separateByDays();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Semantics(
            button: false,
            focusable: true,
            child: Padding(
              child: list[index],
              padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            ));
      },
    );
  }
}
