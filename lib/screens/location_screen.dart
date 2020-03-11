import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/services/weather.dart';


class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationweather});

  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather=WeatherModel();
  int temperature;
  int condition;
  String city;
  String icon;
  String msg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   UpdateUI(widget.locationweather);
  }


  void UpdateUI(dynamic weatherdata)
  {


     double temp=weatherdata['main']['temp'];
     temperature=temp.toInt();
    var condition=weatherdata['weather'][0]['id'];
    icon=weather.getWeatherIcon(condition);
    city=weatherdata['name'];
    msg=weather.getMessage(temperature);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var weatherdata=await weather.getWeatherData();
                      UpdateUI(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{

                     var typedName= await Navigator.push(context,MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                      if(typedName!=null)
                        {
                          var weatherData=await weather.getCityweather(typedName);
                          UpdateUI(weatherData);

                        }
                      //print(typedName);
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
                      temperature.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$msg in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//double temperature=decodes['main']['temp'];
//        int condition=decodes['weather'][0]['id'];
//        String city=decodes['name'];