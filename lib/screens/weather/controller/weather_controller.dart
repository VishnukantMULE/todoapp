import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/screens/weather/model/weather_model.dart';

class WeatherController {
  final WeatherModel weatherModel;
  WeatherController(this.weatherModel);
  final TextEditingController citynamecontroller = TextEditingController();

  Future<void> getGeoCordinates(String cityname) async {
    try {
      final response = await fetchGeoCordinates(cityname);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (data['results'] != null && data['results'].isNotEmpty) {
          final firstResult = data['results'][0];
          weatherModel.latitude = firstResult['latitude'];
          weatherModel.langitute = firstResult['longitude'];
          weatherModel.cityName = firstResult['country'];
          print('Latitude: ${weatherModel.latitude}, Longitude: $longitude, Country: $country');
        } else {
          print('No results found');
        }
      } else {
        print('Failed to fetch geocordinates');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<http.Response> fetchGeoCordinates(String cityname) {
    return http.get(Uri.parse('https://geocoding-api.open-meteo.com/v1/search?name=$cityname'));
  }
}
