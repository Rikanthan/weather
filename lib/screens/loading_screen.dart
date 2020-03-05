

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';

import 'location.dart';
import 'package:weather/services/networking.dart';
//import 'dart:js';

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

  void getLocation() async

  {
    Location location=Location();
    await location.getCurrentLocation();
    longitude=location.longitude;
    lattitude=location.latitude;


    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lattitude&lon=$longitude&appid=$Apikey&units=metric');
    var weatherData=await networkHelper.getData();

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
