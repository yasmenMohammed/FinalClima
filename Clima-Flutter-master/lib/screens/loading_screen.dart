import 'package:clima/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const apiKey = "8f41cf36d26425ed65f3875943abe8f2";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longtude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longtude = location.longtude;
  }

  void getData() async {
    Response response = await get(
        "api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtude.longtude&appid=$apiKey");
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
