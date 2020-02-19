import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();
    getLocation();
  }

  void getLocation() async

  {
    Location location=Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }


  void getData() async
  {
    http.Response response=await http.get('https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22');

    if(response.statusCode==200)
      {
        String data=response.body;
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
