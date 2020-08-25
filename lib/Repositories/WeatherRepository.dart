import 'package:http/http.dart' as http;
import 'package:weather/Models/Location/Location.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';
import 'dart:convert';

class WeatherRepo {
  Future<List<WeatherModel>> getWeather(Location location) async {
    final result = await http.Client().get(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${location.lat}&lon=${location.lon}&APPID=6ba3c4cf17198d6de81a5d0a8c67f3ca');
    if (result.statusCode != 200) {
      throw Exception();
    }

    return parseJson(result.body);
  }

  List<WeatherModel> parseJson(final response) {
    final jsonDecoded = json.decode(response);
    final List<dynamic> jsonWeather = jsonDecoded['list'];
    List<WeatherModel> list = [];
    jsonWeather.forEach((element) {
      list.add(WeatherModel.fromJson(element));
    });
    return list;
  }
}
