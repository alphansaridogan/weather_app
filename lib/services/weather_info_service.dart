import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Future<Weather>? getWeather(String? location) async{
    var weatherUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=5520a4bce310f17e37b40eb9281755ca&units=metric'
    );

    var response = await http.get(weatherUrl);


      var jsonBodyWeather = jsonDecode(response.body);
      print(Weather.fromJson(jsonBodyWeather).icon);
      return Weather.fromJson(jsonBodyWeather);




  }
}