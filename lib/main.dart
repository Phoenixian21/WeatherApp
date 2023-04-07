import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'images.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "poppins",
      ),
      debugShowCheckedModeBanner: false,
      home: const WeatherApp(),
      title: "WEATHER APP",
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateFormat("yMMMMd").format(DateTime.now());
    return Scaffold(
      backgroundColor: Color.fromARGB(247, 255, 255, 255),
      appBar: AppBar(
        title: "$date".text.white.make(),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.light_mode,
                color: Vx.gray600,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Vx.gray600,
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(199, 187, 203, 203),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 179, 197)),
                accountName: Text("Aditya Mane"),
                accountEmail: Text("adityamane057@gmail.com"),
                currentAccountPicture: Image.asset("assets/profile.png")),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: (() {}),
                child: Text("FeedBack"),
                style: ElevatedButton.styleFrom(fixedSize: Size(100, 35)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            ElevatedButton(
              onPressed: (() {}),
              child: Text("Settings"),
              style: ElevatedButton.styleFrom(fixedSize: Size(100, 35)),
            )
          ]),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "PUNE"
                .text
                .fontFamily("poppins_bold")
                .fontWeight(FontWeight.bold)
                .size(32)
                .letterSpacing(1)
                .make(),
            Row(
              children: [
                Image.asset(
                  "assets/01d.png",
                  height: 100,
                  width: 100,
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "35C ",
                      style: TextStyle(
                          color: Vx.gray600,
                          fontSize: 33,
                          fontFamily: "poppins")),
                  TextSpan(
                      text: "Sunny",
                      style: TextStyle(
                        color: Vx.gray900,
                        letterSpacing: 3,
                        fontSize: 14,
                        fontFamily: "poppins",
                      )),
                ]))
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.expand_less_rounded,
                        color: Vx.gray400),
                    label: "41C ".text.make()),
                TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.expand_more_rounded,
                        color: Vx.gray400),
                    label: "28C ".text.make()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                var iconsList = [clouds, humidity, windspeed];
                var values = ["70%", "40%", "3.5km/hr"];
                return Column(
                  children: [
                    Image.asset(
                      iconsList[index],
                      height: 80,
                      width: 75,
                    ).box.padding(const EdgeInsets.all(15)).roundedSM.make(),
                    values[index].text.make()
                  ],
                );
              }),
            ),
            10.heightBox,
            const Divider(
              thickness: 5,
              color: Colors.green,
            ),
            20.heightBox,
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          "${index + 1} AM".text.black.make(),
                          Image.asset(
                            "assets/09n.png",
                            width: 80,
                          ),
                          "${index + 38} C".text.black.make()
                        ],
                      ),
                    );
                  }),
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                "NEXT 7 DAYS".text.size(16).make(),
                TextButton(onPressed: () {}, child: "Viee All".text.make())
              ],
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  var day = DateFormat("EEEE")
                      .format(DateTime.now().add(Duration(days: index + 1)));
                  return Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: Row(
                        children: [
                          day.text.semiBold.make(),
                          TextButton.icon(
                            onPressed: null,
                            icon: Image.asset("assets/50n.png", width: 50),
                            label: Text("26 C"),
                          ),
                          RichText(
                            text: const TextSpan(
                                text: "37",
                                style: TextStyle(
                                    color: (Vx.gray800),
                                    fontFamily: "poppins",
                                    fontSize: 16)),
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
