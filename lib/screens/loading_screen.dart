import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  get http => null;

  void initState() {
    super.initState();
    getLocation();
  }

  Future getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    print(location.latitude);
  }

  void getData() async {
    Response response = await get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=efc5cf13463f01d363fcf9732fc35329'));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonEncode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
    } else {
      print(response.statusCode);
    }
  }

  // String url =
  // 'http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=efc5cf13463f01d363fcf9732fc35329'

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
