import 'dart:collection';

import 'package:wather_apk/domain/Apikey.dart';
import 'package:wather_apk/domain/netWorkService.dart';

class Weather {
  final String cityName;
  final double temp;
  final double feels;
  final double windspeed;
  final int humidity;
  final String description;
  final int presure;
  final int wind;

  Weather(
      {required this.temp,
      required this.feels,
      required this.windspeed,
      required this.humidity,
      required this.description,
      required this.presure,
      required this.wind,
      required this.cityName});

  static Weather fromjson(Map<String, dynamic> json) {
    return Weather(
        temp: json["main"]["temp"],
        feels: json["main"]["feels_like"],
        windspeed: json["wind"]["speed"],
        humidity: json["main"]["humidity"],
        description: json["weather"][0]["description"],
        presure: json["main"]["pressure"],
        wind: json["wind"]["deg"],
        cityName: json["name"]);
  }

  static Future<Weather> searchLocation({required String cityname}) async {
    final url2 =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$Api&units=metric";

    final cityNamedata = await NetworkServices.getWeatherData(url: url2);
    return cityNamedata;
  }

  static Future<Weather> getcurrentLocation(
      {required double latitude, required double logitude}) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$logitude&appid=$Api&units=metric";

    final data = await NetworkServices.getWeatherData(url: url);
    return data;
  }
}
