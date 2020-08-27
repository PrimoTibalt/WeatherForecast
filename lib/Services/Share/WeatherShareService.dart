import 'package:weather/Models/Weather/WeatherModel.dart';

abstract class WeatherShareService {
  final List<WeatherModel> list;

  WeatherShareService(this.list);

  share();
}
