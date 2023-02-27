import 'package:http/http.dart' as http;
import 'package:weathergo/models/currentWeathermodel.dart';
import 'package:weathergo/models/hourly_weathermodel.dart';
import 'package:weathergo/string.dart';
import 'package:weathergo/string.dart';
var link="https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";
var link2="https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey";
getCurrentWeather() async{
  var res=await http.get(Uri.parse(link));
  if(res.statusCode==200)
    {
      var data=postFromJson(res.body.toString());
      print("successful");
      return data;
    }
}
getHourlyWeather() async{
  var res=await http.get(Uri.parse(link2));
  if(res.statusCode==200)
  {
    var data=hourlyWeatherDataFromJson(res.body.toString());
    print(" hourly successful");
    return data;
  }
}