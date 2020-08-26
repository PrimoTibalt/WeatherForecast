import 'package:flutter/material.dart';

class WeatherIconService {
  final String weather;

  WeatherIconService(this.weather);

  Image getIcon() {
    String file = this._chooseFile(this.weather);

    return Image.asset(
      file,
      scale: 1.0,
      height: 80,
      width: 80,
    );
  }

  Image getLargeIcon() {
    String file = this._chooseFile(this.weather);

    return Image.asset(
      file,
      scale: 2.0,
      height: 160,
      width: 160,
    );
  }

  String _chooseFile(String weather) {
    String file = '';
    if (weather == 'light rain' ||
        weather == 'shower rain' ||
        weather.contains('rain')) {
      file = 'assets/icons/Weather/PNG/512/cloudRainWeather.png';
    } else if (weather == 'overcast clouds') {
      file = 'assets/icons/Weather/PNG/512/cloudCloudyWeather.png';
    } else if (weather == 'clear sky') {
      file = 'assets/icons/Weather/PNG/512/hotSunSunnyWeather.png';
    } else if (weather == 'broken clouds') {
      file = 'assets/icons/Weather/PNG/512/cloudCloudyWeather.png';
    } else if (weather == 'scattered clouds' || weather == 'few clouds') {
      file = 'assets/icons/Weather/PNG/512/cloudSunSunnyWeather.png';
    } else if (weather == 'thunderstorm' ||
        weather == 'thunderstorm with light rain' ||
        weather == 'thunderstorm with rain' ||
        weather == 'thunderstorm with heavy rain' ||
        weather == 'light thunderstorm' ||
        weather == 'heavy thunderstorm' ||
        weather == 'ragged thunderstorm' ||
        weather == 'thunderstorm with light drizzle' ||
        weather == 'thunderstorm with drizzle' ||
        weather == 'thunderstorm with heavy drizzle' ||
        weather.contains('thunderstorm')) {
      file = 'assets/icons/Weather/PNG/512/heavyRainStormThunderWeather.png';
    } else if (weather == 'snow' || weather.contains('snow')) {
      file = 'assets/icons/Weather/PNG/512/coldWeatherWinter.png';
    } else if (weather == 'mist' ||
        weather.contains('mist') ||
        weather == 'fog' ||
        weather.contains('fog') ||
        weather == 'Smoke' ||
        weather.contains('Smoke')) {
      file = 'assets/icons/Weather/PNG/512/cloudFogWeather.png';
    } else if (weather == 'Haze' || weather == 'dust whirls') {
      file = 'assets/icons/Weather/PNG/512/hotSummerSunUmbrellaWeather.png';
    } else {
      file = 'assets/icons/Weather/PNG/512/hotSummerSunUmbrellaWeather.png';
    }

    return file;
  }
}
