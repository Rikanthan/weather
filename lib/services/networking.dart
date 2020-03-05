
import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper
{
  NetworkHelper(this.url);
  final String url;
    var Apikey='067ad514cf62f9ba62b5ea5d5ffa57d1';

  Future getData() async{

    http.Response response=await http.get(url);// 'https://api.openweathermap.org/data/2.5/weather?lat=$lattitude&lon=$longitude&appid=$Apikey');


    if(response.statusCode==200)
    {
      String data=response.body;
      return jsonDecode(data);

    }
    else{
      print(response.statusCode);
    }

  }









}

