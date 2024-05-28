import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/bloc/currentweatherbloc/bloc/currentweather_bloc.dart';
import 'package:weather_app/bloc/daysforecasting/bloc/days_forecast_bloc.dart';
import 'package:weather_app/bloc/forecastbloc/bloc/forecast_bloc.dart';
import 'package:weather_app/models/citymodel.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/constant.dart';
import 'package:weather_app/screens/detailpage.dart';
import 'package:weather_app/screens/widget/weather_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Constants myConstants = Constants();

  String location = 'Nairobi'; //Our default city

  var selectedCities = City.getSelectedCities();
  List<String> cities = City.citiesList.map((city) => city.city).toList();


 
  final DaysForecastBloc daysForecastBloc = DaysForecastBloc();
  final ForecastBloc forecastBloc = ForecastBloc();
  final CurrentweatherBloc currentweatherBloc = CurrentweatherBloc();

  @override
  void initState() {
    currentweatherBloc.add(InitializeWeatherEvent(city: location));
    forecastBloc.add(ForeCastInitialize(location: location,day: DateFormat('yyyy-MM-dd').format(DateTime.now())));
    daysForecastBloc.add(DayInitializeForecast(location: location));

    //For all the selected cities from our City model, extract the city and add it to our original cities list
    
    super.initState();
  }

  //Create a shader linear gradient
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    //Create a size variable for the mdeia query
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Our profile image
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  'assets/lightrain.png',
                  width: 40,
                  height: 40,
                ),
              ),
              //our location dropdown
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pin.png',
                    width: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: location,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: cities.map((String location) {
                          return DropdownMenuItem(
                              value: location, child: Text(location));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            location = newValue!;
                            daysForecastBloc.add(DayInitializeForecast(location: location));
                            currentweatherBloc
                                .add(InitializeWeatherEvent(city: location));
                            forecastBloc.add(ForeCastInitialize(location: location, day: DateFormat('yyyy-MM-dd').format(DateTime.now())));
                          });
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: BlocConsumer<CurrentweatherBloc, CurrentweatherState>(
        bloc: currentweatherBloc,
        listenWhen: (previous, current) => current is ActionCurrentWeatherState,
        buildWhen: (previous, current) => current is! ActionCurrentWeatherState,
        listener: (context, state) {
         
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CurrentWeatherLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case CurrentWeatherErrorState:
              final error = state as CurrentWeatherErrorState;
              return Text(error.error);
            case CurrentWeatherSuccessState:
              final currentsuccess = state as CurrentWeatherSuccessState;

          return ListView(
  children: [
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        location,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(currentsuccess.current.location.localtime, style: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),),
    ),
    const SizedBox(
      height: 50,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
  width: size.width * 0.9,
  height: 200,
  decoration: BoxDecoration(
    color: currentsuccess.current.current.isDay == 1
        ? Colors.blue.withOpacity(0.7) // Blue with clouds look for day
        : Colors.black.withOpacity(0.7), // Smoke black for night
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: myConstants.primaryColor.withOpacity(.5),
        offset: const Offset(0, 25),
        blurRadius: 10,
        spreadRadius: -12,
      ),
    ],
  ),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned(
        top: -40,
        left: -20,
        child: currentsuccess.current.current.isDay == 1
            ? Image.asset(
                'assets/clear.png',
                width: 150,
              )
            : Image.asset(
                'assets/moon.png',
                width: 150,
              ),
      ),
      Positioned(
        bottom: 30,
        left: 20,
        child: Text(
          currentsuccess.current.current.condition.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      Positioned(
        top: 20,
        right: 20,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                currentsuccess.current.current.tempC.toString(),
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              'o',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),

    ),
    const SizedBox(
      height: 20,
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          weatherItem(
            text: 'Wind Speed',
            value: currentsuccess.current.current.windKph.toInt(),
            unit: 'km/h',
            imageUrl: 'assets/windspeed.png',
          ),
          weatherItem(
            text: 'Humidity',
            value: currentsuccess.current.current.humidity,
            unit: '',
            imageUrl: 'assets/humidity.png',
          ),
          weatherItem(
            text: 'UV',
            value: currentsuccess.current.current.uv.toInt(),
            unit: '',
            imageUrl: 'assets/max-temp.png',
          ),
        ],
      ),
    ),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Today',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          
        ],
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocConsumer<ForecastBloc, ForecastState>(
        listener: (context, state) {
         
        },
        bloc: forecastBloc,
        listenWhen: (previous, current) =>
            current is ActionStateForeCast,
        buildWhen: (previous, current) =>
            current is! ActionStateForeCast,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ForeCastingSuccessState:
              final successdata =
                  state as ForeCastingSuccessState;
              return SizedBox(
                height: 150,  // Provide a fixed height here for the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: successdata
                      .foreCast.forecast.forecastday.first.hour.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index >=
                        successdata.foreCast.forecast.forecastday.first
                            .hour.length) {
                      return const SizedBox.shrink();
                    }
      
                    var forecastDay = successdata
                        .foreCast.forecast.forecastday.first;
      
                    DateTime forecastDateTime =
                        DateTime.parse(
                            forecastDay.hour[index].time);
      
                    DateTime now = DateTime.now();
      
                   
                    int differenceInHours =
                        forecastDateTime.difference(now).inHours;
      
                    String timeDifferenceText;
                    if (differenceInHours > 0) {
                      timeDifferenceText =
                          '$differenceInHours hours from now';
                    } else if (differenceInHours < 0) {
                      timeDifferenceText =
                          '${-differenceInHours} hours ago';
                    } else {
                      timeDifferenceText = 'Currently';
                    }
      
                    return Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20),
                      margin: const EdgeInsets.only(
                          right: 20, bottom: 10, top: 10),
                      width: 80,
                      decoration: BoxDecoration(
                        color: myConstants.primaryColor,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            color: myConstants.primaryColor,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            forecastDay.hour[index].tempC!
                                    .round()
                                    .toString() +
                                "C",
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset(
                            'assets/heavycloud.png',
                            width: 30,
                          ),
                          Text(
                            timeDifferenceText,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
      
            default:
              return Container();
          }
        },
      ),
    ),

    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Weekly ForeCast',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          
        ],
      ),
    ),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocConsumer<DaysForecastBloc, DaysForecastState>(
        listener: (context, state) {
          
        },
        bloc: daysForecastBloc,
        listenWhen: (previous, current) =>
            current is ActionStateForeCast,
        buildWhen: (previous, current) =>
            current is! ActionStateForeCast,
        builder: (context, state) {
          switch (state.runtimeType) {
            case DayForeCastSucessState:
              final successdata =
                  state as DayForeCastSucessState;
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: successdata
                    .foreCast.forecast.forecastday.length,
                itemBuilder: (BuildContext context, int index) {
                  

                   
                 
                    
                  var forecastDay = successdata
                      .foreCast.forecast.forecastday[index];

                     String dayName = DateFormat('EEEE').format(DateTime.parse(forecastDay.date));

                  return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        consolidatedWeatherList: forecastDay,
                        selectedId: index,
                        location: location,
                      ),
                    ),
                  );
                },
                child: Container(
                  
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  margin: const EdgeInsets.only( bottom: 10, top: 10),
                  width: 150,
                  decoration: BoxDecoration(
                    color: myConstants.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: myConstants.primaryColor,
                      ),
                    ],
                  ),
                  child: Row(
                    
                    children: [
                      Text(
                        forecastDay.day.avgtempC.round().toString() + "°C",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 50,),
                      Image.asset(
                        'assets/heavycloud.png',
                        width: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dayName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                forecastDay.day.condition.text,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 40,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Max: ${forecastDay.day.maxtempC}°C',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Min: ${forecastDay.day.mintempC}°C',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
                    
                  
                    
                  
                },
              );
      
            default:
              return Container();
          }
        },
      ),
    )

  ],
);


            default:
              return Container();
          }
        },
      ),
    );
  }
}
