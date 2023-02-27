//import 'package:demo_application/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weathergo/services/api_service.dart';
import 'package:geolocator/geolocator.dart';

class Mycontroller extends GetxController
{
  @override
  void onInit() async
  {
    await getUserLocation();
    currentweatherdata=getCurrentWeather(latitude.value,longitude.value);
    hourlyWeatherData=getHourlyWeather(latitude.value,longitude.value);
    super.onInit()
;  }



var isDark=false.obs;
  var currentweatherdata;
  var hourlyWeatherData;
  var latitude=0.0.obs;
  var longitude=0.0.obs;
  var isloaded=false.obs;

changeTheme()
{
  isDark.value=!isDark.value;
  Get.changeThemeMode(isDark.value? ThemeMode.dark:ThemeMode.light);


}
getUserLocation()async{
  var islocationenabled;
  var userpermission;
   islocationenabled=await Geolocator.isLocationServiceEnabled();
  if(!islocationenabled)
  {
      return Future.error("LOCATION IS NOT ENABLED");

  }
  userpermission=await Geolocator.checkPermission();
  if(userpermission==LocationPermission.deniedForever)
    {
      return Future.error("Permisssion is denied Forever");
    }
  else if(userpermission==LocationPermission.denied)
    {
        userpermission=await Geolocator.requestPermission();
        if(userpermission==LocationPermission.denied)
          {
            return Future.error("PERMISSION IS DENIED");
          }
    }
   return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) => {latitude.value=value.latitude,longitude.value=value.longitude,isloaded.value});

}

}
