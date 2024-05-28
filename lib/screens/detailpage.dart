import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/models/constant.dart';
import 'package:weather_app/models/forecastmodel.dart';
import 'package:weather_app/screens/welcome.dart';

class DetailPage extends StatefulWidget {
  final Forecastday consolidatedWeatherList;
  final int selectedId;
  final String location;

  const DetailPage(
      {Key? key,
      required this.consolidatedWeatherList,
      required this.selectedId,
      required this.location})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();

    //Create a shader linear gradient
    const LinearGradient(
      colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    int selectedIndex = widget.selectedId;
     // Use dot notation


    return Scaffold(
      backgroundColor: myConstants.secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: myConstants.secondaryColor,
        elevation: 0.0,
        title: Text(widget.location),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Welcome()));
                },
                icon: const Icon(Icons.settings)),
          )
        ],
      ),
      body: ListView.builder(
          
          itemCount: widget.consolidatedWeatherList.hour.length,
          itemBuilder: (BuildContext context, int index) {
// Use dot notation
           
            var parsedDate = DateTime.parse(widget.consolidatedWeatherList.hour[index].time); // Use dot notation
            var newDate = DateFormat('EEEE').format(parsedDate).substring(0, 3);
      
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
               
                width: 80,
                decoration: BoxDecoration(
                    color: index == selectedIndex
                        ? Colors.white
                        : const Color(0xff9ebcf9),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.blue.withOpacity(.3),
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.consolidatedWeatherList.hour[index].tempC}C", // Use dot notation
                      style: TextStyle(
                        fontSize: 17,
                        color: index == selectedIndex
                            ? Colors.blue
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      "assets/showers.png",
                      width: 40,
                    ),
                    Text(
                      newDate,
                      style: TextStyle(
                        fontSize: 17,
                        color: index == selectedIndex
                            ? Colors.blue
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
