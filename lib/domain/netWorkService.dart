import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart ' as http;
import 'package:wather_apk/domain/model.dart';

class NetworkServices {
  static Future<Weather> getWeatherData({required String url}) async {
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final weather = Weather.fromjson(body);
      return weather;
    }

    return Weather(
        temp: 0,
        feels: 0,
        windspeed: 0,
        humidity: 0,
        description: '',
        presure: 0,
        wind: 0,
        cityName: '');
  }
}
