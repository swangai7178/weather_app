import 'dart:convert';
import 'package:http/http.dart' as http;


class WeatherService {
  static const String apiKey = 'a63e2d86ce684f1ab7f63713242805'; // Replace with your WeatherAPI key
  static const String weatherUrl = 'http://api.weatherapi.com/v1/current.json?key=';




static getweathercurrent(String location) async{
   var response = await http.get(Uri.parse(weatherUrl + apiKey + '&q=' + location));
    var result = json.decode(response.body);

    
   
    return result;
   
  }

  
   static const String weatherUrlforecast = 'http://api.weatherapi.com/v1//forecast.json?key=';

   static getweatherforecast(String location, day) async{

    var response = await http.get(Uri.parse('$weatherUrlforecast$apiKey&q=$location&dt=$day&days=6'));
    var result = json.decode(response.body);
     
    
   
    return result;
       
        }


        static getweatherforecastdays(String location) async{

    var response = await http.get(Uri.parse('$weatherUrlforecast$apiKey&q=$location&days=6'));
    var result = json.decode(response.body);
     
    
   
    return result;
       
        }

       
      
  }

 
