import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

import '../../models/five_weather_model.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInit());
  static WeatherCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherModel;
  void getCurrentWeather({
    String city = "zagazig",
  }) {
    emit(GetCurrentWeatherLoading());
    DioHelperWeather.getData(
            url: 'weather',
            city: city,
            )
        .then((value) {
      weatherModel = WeatherModel.fromJson(value.data);
      emit(GetCurrentWeatherSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetCurrentWeatherError());
    }
    );
  }

  List<WeatherModel>? list=[];
  List<String> name =["zagazig","cairo","alexandria","london","giza"];
  void getFiveCity(){

    emit(GetCityWeatherLoading());
    for(int i =0;i<= name.length-1;i++){

      DioHelperWeather.getData(
        url: 'weather',
        city: name[i],
      ).then((value) {
        list!.add(WeatherModel.fromJson(value.data));
      }).catchError((error) {
        print(error.toString());
        emit(GetCityWeatherError());
      }
      );
    }
    emit(GetCityWeatherSuccess());
  }




   FiveWeatherModel? fiveWeatherModel;
  void getFiveWeather({
    String city = "zagazig",
  }) {
    emit(GetFiveWeatherLoading());
    DioHelperWeather.getData(
      url: 'forecast',
      city: city,
    )
        .then((value) {
      fiveWeatherModel = FiveWeatherModel.fromJson(value.data);
      emit(GetFiveWeatherSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetFiveWeatherError());
    });
  }



}
