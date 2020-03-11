
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';




const Apikey='067ad514cf62f9ba62b5ea5d5ffa57d1';

class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  double lattitude;
  double longitude;

  void initState(){
    super.initState();
    getLocation();

  }

  void getLocation()

  {
    var weatherData=WeatherModel().getWeatherData();


    Navigator.push(context,MaterialPageRoute(builder: (context){
      return LocationScreen(locationweather:weatherData);
    }));
  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),

    );
  }
}
