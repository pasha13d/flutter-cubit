import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_forecast/data/model/weather.dart';
import 'package:weather_forecast/data/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async{
    try {
      // for initial state. when there's getting no data
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError('Couldn\'t fetch weather data.'));
    }
  }
}