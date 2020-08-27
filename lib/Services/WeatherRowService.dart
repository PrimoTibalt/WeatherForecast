import 'package:flutter/material.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';

import 'WeatherIconService.dart';

class WeatherRowService {
  final WeatherModel weather;
  final BuildContext context;

  WeatherRowService(
    this.weather,
    this.context,
  );

  Row getRow() {
    return Row(
      children: [
        Container(
          child: (WeatherIconService(weather.general.description)).getIcon(),
          width: MediaQuery.of(context).size.width * 0.15,
          margin: EdgeInsets.only(right: 10),
        ),
        Container(
          child: Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(weather.additional.time),
                    Text(weather.general.weather),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                width: MediaQuery.of(context).size.width * 0.45,
              ),
              Container(
                child: Text(
                  weather.data.celsiusTemp,
                  style: TextStyle(
                      fontSize: 42,
                      color: Colors.blue[700],
                      fontFamily: 'Brandon'),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.grey[300]),
          )),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
