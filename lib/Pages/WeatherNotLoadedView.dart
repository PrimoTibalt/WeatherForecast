import 'package:flutter/material.dart';
import 'package:weather/Services/WeatherErrorMessageService.dart';

class WeatherNotLoadedView extends StatelessWidget {
  final error;

  WeatherNotLoadedView(this.error);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            'assets/icons/Weather/PNG/512/hotSunSunnyWeather.png',
            scale: 3.0,
            height: 160,
            width: 160,
            color: Colors.grey[400],
          ),
          Container(
            child: Text(WeatherErrorMessageService.beutifulVersion(error),
                style: TextStyle(fontSize: 30, color: Colors.black87)),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
