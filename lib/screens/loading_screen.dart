import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';

import 'package:http/http.dart';

const apiKey = 'efc5cf13463f01d363fcf9732fc35329';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void initState() {
    super.initState();
    getLocationData();
  }

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

  

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=efc5cf13463f01d363fcf9732fc35329');

    var weatherData = await networkHelper.getData();

    print(weatherData);
  }

  // String url =
  // 'http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=efc5cf13463f01d363fcf9732fc35329'

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
