import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/cubit.dart';
import 'package:weather_app/layout/home.dart';
import 'package:weather_app/shared/bloc_observer.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelperWeather.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>WeatherCubit()..getCurrentWeather()..getFiveWeather()..getFiveCity(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
