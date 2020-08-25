import 'package:bloc/bloc.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';
import 'package:weather/Repositories/LocationRepository.dart';
import 'package:weather/Repositories/WeatherRepository.dart';

import 'Events/FetchWeather.dart';
import 'Events/WeatherEvent.dart';
import 'States/WeatherIsLoading.dart';
import 'States/WeatherIsNotLoaded.dart';
import 'States/WeatherList.dart';
import 'States/WeatherState.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(WeatherState initialState, this.weatherRepo)
      : super(initialState);

  WeatherRepo weatherRepo;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      try {
        List<WeatherModel> weather = await this
            .weatherRepo
            .getWeather(await LocationRepo().getCurrentLocation());
        yield WeatherList(weather);
      } catch (e) {
        yield WeatherIsNotLoaded();
      }
    }
  }
}
