import 'package:flutter/material.dart';
import 'package:weather/Bloc/Events/FetchWeather.dart';
import 'package:weather/Bloc/WeatherBloc.dart';

class WeatherIsLoadingView extends StatelessWidget {
  final WeatherBloc bloc;

  const WeatherIsLoadingView(this.bloc);
  @override
  Widget build(BuildContext context) {
    this.bloc.add(FetchWeather());
    return Center(
      child: Text('Wait, please...', style: TextStyle(fontSize: 30)),
    );
  }
}
