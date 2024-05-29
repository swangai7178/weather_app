import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/models/constant.dart';
import 'package:weather_app/models/forecastmodel.dart';

class DetailPage extends StatefulWidget {
  final Forecastday consolidatedWeatherList;
  final int selectedId;
  final String location;

  const DetailPage(
      {super.key,
      required this.consolidatedWeatherList,
      required this.selectedId,
      required this.location});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String imageUrl = '';

    int? _expandedIndex;

  void _toggleExpand(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = null;
      } else {
        _expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();

    //Create a shader linear gradient
    const LinearGradient(
      colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

   
     // Use dot notation


    return Scaffold(
      backgroundColor: myConstants.secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: myConstants.secondaryColor,
        elevation: 0.0,
        title: Text(widget.location, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: const [
          
        ],
      ),
      body:  ListView.builder(
        itemCount: widget.consolidatedWeatherList.hour.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var weather = widget.consolidatedWeatherList.hour[index];
          var parsedDate = DateTime.parse(weather.time);
          var formattedTime = DateFormat('h a').format(parsedDate);
          var dayOfWeek = DateFormat('EEEE').format(parsedDate).substring(0, 3);
          var temperature = "${weather.tempC}°C";
          bool isExpanded = _expandedIndex == index;

          return GestureDetector(
            onTap: () => _toggleExpand(index),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                width: isExpanded ? 200 : 100, // Adjust width when expanded
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isExpanded
                        ? [Colors.white, Colors.white]
                        : [const Color(0xff9ebcf9), const Color(0xff5e88f7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (isExpanded)
                      Text(
                        "Time: $formattedTime",
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Text(
                      "Temp: $temperature",
                      style: TextStyle(
                        fontSize: 20,
                        color: isExpanded ? Colors.blue : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      getWeatherIcon(weather.condition.text),
                      width: 40,
                    ),
                    Text(
                      "Day: $dayOfWeek",
                      style: TextStyle(
                        fontSize: 16,
                        color: isExpanded ? Colors.blue : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Time: $formattedTime",
                      style: TextStyle(
                        fontSize: 16,
                        color: isExpanded ? Colors.blue : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (isExpanded) ...[
                      Text(
                        "Humidity: ${widget.consolidatedWeatherList.hour[index].humidity}%",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Wind: ${widget.consolidatedWeatherList.hour[index].windKph} km/h",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String getWeatherIcon(String condition) {
    switch (condition) {
      case 'Clear':
        return 'assets/sunny.png';
      case 'Rain':
        return 'assets/rain.png';
      case 'Clouds':
        return 'assets/cloudy.png';
      // Add more conditions as needed
      default:
        return 'assets/showers.png';
    }
}}
