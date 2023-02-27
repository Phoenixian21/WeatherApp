// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));



class Post {
  Post({

    required this.weather,

    required this.main,

    required this.wind,
    required this.clouds,
    required this.dt,



    required this.name,

  });


  List<Weather> weather;

  Main main;

  Wind wind;
  Clouds clouds;
  int dt;


  String name;

  factory Post.fromJson(Map<String, dynamic> json) => Post(

    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),

    main: Main.fromJson(json["main"]),

    wind: Wind.fromJson(json["wind"]),
    clouds: Clouds.fromJson(json["clouds"]),
    dt: json["dt"],

    name: json["name"],

  );


}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}


class Main {
  Main({
    required this.temp,

    required this.tempMin,
    required this.tempMax,

    required this.humidity,

  });

  double temp;

  double tempMin;
  double tempMax;

  int humidity;


  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"]?.toDouble(),

    tempMin: json["temp_min"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),

    humidity: json["humidity"],

  );

  Map<String, dynamic> toJson() => {
    "temp": temp,

    "temp_min": tempMin,
    "temp_max": tempMax,

    "humidity": humidity,

  };
}



class Weather {
  Weather({

    required this.main,

    required this.icon,
  });


  String main;

  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(

    main: json["main"],

    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {

    "main": main,

    "icon": icon,
  };
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,

  });

  double speed;
  int deg;


  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],

  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,

  };
}
