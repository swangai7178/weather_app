import 'package:flutter/material.dart';
import 'package:weather_app/screens/getstarted.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: GetStartedScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}  