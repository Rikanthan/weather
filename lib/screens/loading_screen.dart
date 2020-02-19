import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'location.dart';


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
    getData();
  }

  void getLocation() async

  {
    Location location=Location();
    await location.getCurrentLocation();
    longitude=location.longitude;
    lattitude=location.latitude;
  }


  void getData() async
  {
    http.Response response=await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=$lattitude&lon=$longitude&appid=$Apikey');

    if(response.statusCode==200)
      {
        String data=response.body;
        var decodes=jsonDecode(data);

        double temperature=decodes['main']['temp'];
        int condition=decodes['weather'][0]['id'];
        String city=decodes['name'];
        print(temperature);
        print(condition);
       print(city);

      }
    else{
      print(response.statusCode);
    }




  }


  @override
  Widget build(BuildContext context) {

    getData();
    return Scaffold(

    );
  }
}
