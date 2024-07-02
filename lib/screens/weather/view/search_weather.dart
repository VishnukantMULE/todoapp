import 'package:flutter/material.dart';
import 'package:todoapp/screens/weather/controller/weather_controller.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({super.key});

  @override
  State<SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  late final WeatherController weatherController;

  @override
  void initState() {
    super.initState();
    weatherController = WeatherController(); // Initialize here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Weather"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search City Name',
              labelText: 'Search City', // Changed label to labelText
            ),
            controller: weatherController.citynamecontroller,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                weatherController.getGeoCordinates(weatherController.citynamecontroller.text);
              });
            },
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
