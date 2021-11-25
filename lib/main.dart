import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/cubit/weather_cubit.dart';
import 'package:weather_forecast/data/weather_repository.dart';
import 'package:weather_forecast/pages/weather_search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather News',
      home: BlocProvider(
          create: (context) => WeatherCubit(FakeWeatherRepository()),
          child: WeatherSearchPage(),
      )
    );
  }
}

