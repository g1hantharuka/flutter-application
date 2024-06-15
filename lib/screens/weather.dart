import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String _weather = '';
  String _temperature = '';
  String _country = '';
  String _city = '';
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  // Check and request location permission
  Future<void> _checkLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      _fetchLocationAndWeather();
    } else {
      setState(() {
        _weather = 'Location permission denied';
      });
    }
  }

  // Function to fetch weather details using coordinates
  Future<void> _fetchWeather(double lat, double lon) async {
    final apiKey =
        '62316320be616a81d504b9991522dec0'; // Replace with your OpenWeatherMap API key
    final url =
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final weatherDescription = jsonData['weather'][0]['description'];
        final temperature =
            (jsonData['main']['temp'] - 273.15).toStringAsFixed(2);
        final country = jsonData['sys']['country'];
        final name = jsonData['name'];

        setState(() {
          _weather = '$weatherDescription';
          _temperature = '$temperature°C';
          _country = '$country';
          _city = '$name';
        });
      } else {
        setState(() {
          _weather = 'Failed to fetch weather';
        });
      }
    } catch (error) {
      setState(() {
        _weather = 'Error: $error';
      });
    }
  }

  // Function to fetch current location coordinates
  Future<void> _fetchLocationAndWeather() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _isConnected = false;
        
      });
      // return;
    }
  // PRINT connectivity result
    print(connectivityResult);
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _fetchWeather(position.latitude, position.longitude);
    } catch (error) {
      setState(() {
        _weather = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!_isConnected)
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'You are not connected to the internet',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (_isConnected)
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/weather.jpg',
                        width: double.infinity,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Location: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '$_city, $_country',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Weather: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _weather,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Temperature: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _temperature,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
