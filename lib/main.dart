import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Events/SeeCurrentWeather.dart';
import 'package:weather/Bloc/Events/SeeListOfWeather.dart';
import 'package:weather/Bloc/States/WeatherCurrent.dart';
import 'package:weather/Bloc/States/WeatherIsLoading.dart';
import 'package:weather/Bloc/States/WeatherIsNotLoaded.dart';
import 'package:weather/Pages/WeatherCurrentView.dart';
import 'package:weather/Pages/WeatherIsLoadingView.dart';
import 'package:weather/Pages/WeatherNotLoadedView.dart';
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
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black12),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherIsLoading) {
            return WeatherIsLoadingView(weatherBloc);
          } else if (state is WeatherList) {
            _selectedIndex = 1;
            return WeatherListView(state.getWeather);
          } else if (state is WeatherCurrent) {
            _selectedIndex = 0;
            return WeatherCurrentView(state.getWeather);
          } else if (state is WeatherIsNotLoaded) {
            return WeatherNotLoadedView(state.error);
          } else {
            throw UnimplementedError('Unexpected state!');
          }
        }),
        bottomNavigationBar:
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Today'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('List'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueAccent,
            onTap: (index) {
              if (state is WeatherList) {
                weatherBloc.add(index == 0
                    ? SeeCurrentWeather(state.getWeather)
                    : SeeListOfWeather(state.getWeather));
              } else if (state is WeatherCurrent) {
                weatherBloc.add(index == 0
                    ? SeeCurrentWeather(state.getWeather)
                    : SeeListOfWeather(state.getWeather));
              }
              _selectedIndex = index;
            },
          );
        }));
  }
}
