import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/weather_helper.dart';
import 'package:flutter_application_1/modal/weather_modal.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModal? weatherModal;
  String? cityName;
  String? c;
  String? cityN;
  List<WeatherModal> cities = [];
  int selectedIndex = 0;
  int index = 0;
  bool isSelected = false;
  List<Color> colorList = [
    Colors.grey,
    Colors.purple,
    Colors.amber,
    Colors.blue,
  ];

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void getWeatherData(String city) async {
    weatherModal = await WeatherHelper.wh.weatherParsing(city);
    if (weatherModal != null) {
      cityName = city;
      print("City: ${weatherModal?.locationModal?.name}");
      notifyListeners();
    }
  }

  void addCities(String city) async {
    weatherModal = await WeatherHelper.wh.weatherParsing(city);
    cities.add(weatherModal!);
    notifyListeners();
  }

  void getCityName(String name) {
    cityN = name;
    notifyListeners();
  }

  void geti(int i) {
    index = i;
  }

  void getc(String city) {
    c = city;
    notifyListeners();
  }

  String? getAddedCities() {
    for (int i = 0; i < cities.length; i++) {
      if (cities[i].locationModal?.name == c) {
        index = i;
        return cities[i].locationModal?.name ?? "";
      }
    }
    return null;
  }

  void checkIsSelected(bool select) {
    isSelected = select;
    notifyListeners();
  }

  void removeCity(int listindex) {
    cities.removeAt(listindex);
    isSelected = false;
    notifyListeners();
  }
}
