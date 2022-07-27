import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/layout/cubit/cubit.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/models/five_weather_model.dart';
import 'package:weather_app/shared/style/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
            body:BuildCondition(
              condition: WeatherCubit.get(context).weatherModel != null && WeatherCubit.get(context).list!.isNotEmpty,
              builder: (context)=>SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 240,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/Weather2.png'
                            ),
                          ),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                              child: TextFormField(
                                decoration:   const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      borderSide: BorderSide(color: defaultColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      )),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: defaultColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  labelText: 'Search',
                                  labelStyle: TextStyle(
                                    color: defaultColor,
                                  ),
                                ),
                                onChanged: (value){
                                  WeatherCubit.get(context).getCurrentWeather(city: value);
                                },
                                controller: searchController,
                                cursorColor: Colors.blue,
                                onFieldSubmitted: (value){
                                  WeatherCubit.get(context).getCurrentWeather(city: value);
                                  searchController.text ='';
                                },
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Enter text to search';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0.0,1.0),
                              child: SizedBox(
                                width: 10,
                                height: 10,
                                child: OverflowBox(
                                  minWidth: 0,
                                  maxWidth: MediaQuery.of(context).size.width,
                                  maxHeight: MediaQuery.of(context).size.height /3.5,
                                  minHeight: 0,
                                  child: Container(
                                    padding:const EdgeInsets.symmetric(horizontal: 15) ,
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      elevation: 10,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:  [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Center(
                                            child: Text(
                                              WeatherCubit.get(context).weatherModel!.name!,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Center(
                                            child: Text(
                                              DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[500]
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 5),
                                            child: Container(
                                              height: 1,
                                              width: double.infinity,
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    WeatherCubit.get(context).weatherModel!.weather![0].description!,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey[400]
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${(WeatherCubit.get(context).weatherModel!.main!.temp! - 273.15).round().toString()}\u2103',
                                                    style: const TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'min : ${(WeatherCubit.get(context).weatherModel!.main!.tempMin! - 273.15).round().toString()}\u2103 / max : ${(WeatherCubit.get(context).weatherModel!.main!.tempMax! - 273.15).round().toString()}\u2103',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey[400]
                                                    ),
                                                  ),

                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children:  [
                                                  const Image(
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/Weather.png'
                                                    ),
                                                  ),
                                                  Text(
                                                    'wind ${WeatherCubit.get(context).weatherModel!.wind!.speed} m/s',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey[400]
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 115,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Other City'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: ListView.separated(
                          itemBuilder:(context,index){
                            return otherCity(context,index);
                          } ,
                          separatorBuilder: (context,index)=>Container(
                            width: 0.5,
                            height: double.infinity,
                            color: Colors.grey[300],
                          ),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: WeatherCubit.get(context).list!.length,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'forecast next dats'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                     SizedBox(
                        height: 180,
                        width: MediaQuery.of(context).size.width,

                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            series: <ChartSeries<FiveWeatherModel, String>>[
                              SplineSeries<FiveWeatherModel, String>(
                                dataSource:<FiveWeatherModel>[
                                  WeatherCubit.get(context).fiveWeatherModel,
                                  WeatherCubit.get(context).fiveWeatherModel,
                                  WeatherCubit.get(context).fiveWeatherModel,
                                  WeatherCubit.get(context).fiveWeatherModel,
                                  WeatherCubit.get(context).fiveWeatherModel,
                                  WeatherCubit.get(context).fiveWeatherModel,
                                ],
                                xValueMapper: (FiveWeatherModel f, _){
                                  return f.list![0].dtTxt.toString().substring(6,11);
                                },
                                yValueMapper: (FiveWeatherModel f, _){
                                  return f.list![0].main!.temp;
                                }
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (context)=>const Center(child: CircularProgressIndicator()),
            ),
          );
      },

    );
  }
}


Widget otherCity(context,index){
  return Container(
    height: 180,
    width: 180,
    padding:const EdgeInsets.all(10) ,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      elevation: 5,
      child: Column(
        children:  [
          Text(
            WeatherCubit.get(context).list![index].name!,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            '${(WeatherCubit.get(context).list![index].main!.temp! - 273.15).round().toString()}\u2103',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
          const Image(
            height: 80,
            width: 80,
            fit: BoxFit.fill,
            image: AssetImage(
                'assets/Weather.png'
            ),
          ),
          Text(
            '${WeatherCubit.get(context).list![index].weather![0].description}',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
        ],
      ),
    ),
  );
}
