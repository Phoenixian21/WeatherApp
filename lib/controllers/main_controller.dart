//import 'package:demo_application/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weathergo/services/api_service.dart';

class Mycontroller extends GetxController
{
  @override
  void onInit()
  {
    currentweatherdata=getCurrentWeather();
    hourlyWeatherData=getHourlyWeather();
    super.onInit()
;  }



var isDark=false.obs;
  var currentweatherdata;
  var hourlyWeatherData;

changeTheme()
{
  isDark.value=!isDark.value;
  Get.changeThemeMode(isDark.value? ThemeMode.dark:ThemeMode.light);

}
}