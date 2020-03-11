import 'package:weather/screens/location.dart';
import 'package:weather/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const Apikey='067ad514cf62f9ba62b5ea5d5ffa57d1';
const WeatherDataUrl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getWeatherData() async
  {

    Location location=Location();
    await location.getCurrentLocation();



    NetworkHelper networkHelper=NetworkHelper('$WeatherDataUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$Apikey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
