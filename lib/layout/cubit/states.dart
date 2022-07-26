import 'package:bloc/bloc.dart';

abstract class WeatherStates{}
class WeatherInit extends WeatherStates{}


class GetCurrentWeatherSuccess extends WeatherStates{}
class GetCurrentWeatherLoading extends WeatherStates{}
class GetCurrentWeatherError extends WeatherStates{}

class GetFiveWeatherLoading extends WeatherStates{}
class GetFiveWeatherSuccess extends WeatherStates{}
class GetFiveWeatherError extends WeatherStates{}

class GetCityWeatherSuccess extends WeatherStates{}
class GetCityWeatherLoading extends WeatherStates{}
class GetCityWeatherError extends WeatherStates{}
