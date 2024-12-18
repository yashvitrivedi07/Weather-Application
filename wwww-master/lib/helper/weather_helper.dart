import 'dart:convert';
import 'package:flutter_application_1/modal/weather_modal.dart';
import 'package:http/http.dart' as http;

class WeatherHelper {
  static WeatherHelper wh = WeatherHelper._();
  WeatherHelper._();
  
  Future<WeatherModal?> weatherParsing(String city) async
  {
      String link = "http://api.weatherapi.com/v1/forecast.json?key=7c14417b2ded4bf3992165754241312&q=$city&days=7&aqi=no&alerts=no";

     http.Response response = await http.post(Uri.parse(link));
     if(response.statusCode == 200)
     {
       var json = jsonDecode(response.body);
       WeatherModal weatherModal = WeatherModal.mapToModal(json);

       return weatherModal;

     }
     return null;
  }

}