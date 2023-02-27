import 'package:http/http.dart' as http;
import 'package:weathergo/models/currentWeathermodel.dart';
import 'package:weathergo/models/hourly_weathermodel.dart';
import 'package:weathergo/string.dart';
import 'package:weathergo/string.dart';


getCurrentWeather(lat,lon) async{
 var link1="https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";
  var res=await http.get(Uri.parse(link1));
  if(res.statusCode==200)
    {
      var data=postFromJson(res.body.toString());
      print("successful");
      return data;
    }
}
getHourlyWeather(lat,lon) async{
  var link2="https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey";
  var res=await http.get(Uri.parse(link2));
  if(res.statusCode==200)
  {
    var data=hourlyWeatherDataFromJson(res.body.toString());
    print(" hourly successful");
    return data;
  }
}