import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int x = 0;
  int index = -1;
  int tempreture;
  var condition;
  var cityName;
  var iconic;
  var message;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    update(widget.locationweather);
    print(tempreture);
  }

  void update(dynamic weatherData) {
    if (weatherData == null) {
      tempreture = 0;
      cityName = '';
      message =
          'unable to get the weather chick if the location service is on.';
      return;
    }
    setState(() {
      double temp = weatherData['main']['temp'];
      tempreture = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      iconic = weatherModel.getWeatherIcon(condition);
      message = weatherModel.getMessage(temp.toInt());
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        var weatherData = WeatherModel().getNewWeatherData();
                        update(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        Future<dynamic> realcity = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          // setState(()async {
                          //   return cityName=await realcity;
                          // });
                          return CityScreen();
                        }));
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$tempreture°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        "$iconic",
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "$message in $cityName!",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
