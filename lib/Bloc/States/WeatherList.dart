import 'package:weather/Bloc/States/WeatherIsLoaded.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';

class WeatherList extends WeatherIsLoaded {
  WeatherList(List<WeatherModel> weather) : super(weather);
}
