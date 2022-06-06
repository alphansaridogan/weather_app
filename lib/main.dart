import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_info_service.dart';
import 'package:weather_app/widgets/AdditionalInfo.dart';
import 'package:weather_app/widgets/current_weather.dart';

import 'models/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const HomeScreen(

      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherService weatherService = WeatherService();
  Weather? data;

  Future<void> getData() async{
    data = await weatherService.getWeather('Izmir');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: const Text('Flutter Weather',
        style: TextStyle(
          fontSize: 28,
        ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                    width: 100,
                    child: Image.asset('assets/${data!.icon}.png')),
                CurrentWeather('${data!.icon}',
                    '${data!.temp}', '${data!.cityName}'),
                const SizedBox(
                  height: 50,
                ),
                const Text('Ek Bilgiler',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                AdittionalInfo(
                    '${data!.wind_kmh}',
                    '${data!.humidity}',
                    '${data!.feels_like}',
                    '${data!.clouds}'),
              ],
            );
          }
          return Container();
        }
      ),
    );
  }
}

