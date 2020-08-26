import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Events/FetchWeather.dart';
import 'package:weather/Bloc/States/WeatherCurrent.dart';
import 'package:weather/Bloc/States/WeatherIsLoading.dart';
import 'package:weather/Bloc/States/WeatherIsNotLoaded.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';
import 'package:weather/Pages/WeatherIsLoadingView.dart';
import 'package:weather/Repositories/LocationRepository.dart';
import 'package:weather/Repositories/WeatherRepository.dart';

import 'Bloc/States/WeatherList.dart';
import 'Bloc/States/WeatherState.dart';
import 'Bloc/WeatherBloc.dart';
import 'Pages/WeatherListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'Flutter Weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Brandon',
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: BlocProvider(
            create: (context) => WeatherBloc(WeatherIsLoading(), WeatherRepo()),
            child: Home(),
          ),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Container(
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherIsLoading) {
          return WeatherIsLoadingView(weatherBloc);
        } else if (state is WeatherList) {
          return WeatherListView(state.getWeather);
        } else if (state is WeatherCurrent) {
          throw UnimplementedError();
        } else if (state is WeatherIsNotLoaded) {
          throw UnimplementedError();
        } else {
          throw UnimplementedError('Unexpected state!');
        }
      }),
    );
  }
}
