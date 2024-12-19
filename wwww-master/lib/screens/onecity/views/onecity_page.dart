import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/weather_provider.dart';
import 'package:provider/provider.dart';

class OnecityPage extends StatefulWidget {
  const OnecityPage({super.key});

  @override
  State<OnecityPage> createState() => _OnecityPageState();
}

class _OnecityPageState extends State<OnecityPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<WeatherProvider>()
        .getWeatherData(context.read<WeatherProvider>().cityN!);
  }

  @override
  Widget build(BuildContext context) {
    var pw = context.watch<WeatherProvider>();
    var pr = context.read<WeatherProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        actions: [
          IconButton(
              onPressed: () {
                pr.addCities(pr.cityN!);
                pr.getc(pr.cityN!);
              },
              icon: const Icon(Icons.check_box))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "${pr.weatherModal?.locationModal!.name}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "${pr.weatherModal?.locationModal?.country}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "${pr.weatherModal?.locationModal?.localtime}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 80,
                child: SizedBox(
                  height: 130,
                  width: 130,
                  child: Image.asset(
                    'lib/assets/images/076ebfc418ba0f89d6eecb1662bfe97d.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Expanded(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        offset: Offset(0, 5),
                        color: Color(0xff95bcfb),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffaacaf9),
                        Color(0xffa4c4f7),
                        Color(0xff95bcfb),
                        Color(0xff94bbfe),
                        Color(0xff7cadfd),
                        Color(0xff749ce1),
                        Color(0xff5896fd),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${pr.weatherModal?.currentModal?.conditionModal?.text}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Tonight",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 9,
                            ),
                            child: Text(
                              "${pr.weatherModal?.currentModal?.temp_c}",
                              style: TextStyle(
                                fontSize: 55,
                                color: Colors.white.withOpacity(.9),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 9,
                            ),
                            child: Text(
                              "Feels like ${pr.weatherModal?.currentModal?.feelslike_c}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                right: 9,
                              ),
                              child: Image.asset(
                                'lib/assets/images/water.png',
                                color: Colors.blue.shade800.withOpacity(.3),
                                cacheHeight: 90,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Positioned(
                  bottom: 60,
                  left: -60,
                  child: SizedBox(
                      height: 180,
                      width: 200,
                      child: Image.network(
                        'http:${pr.weatherModal?.currentModal?.conditionModal?.icon}',
                        height: 100,
                      )),
                ),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100,
                      ),
                      child: Image.asset(
                        'lib/assets/images/perception_12708687.png',
                        cacheWidth: 50,
                        cacheHeight: 50,
                      ),
                    ),
                    Text(
                      "${pr.weatherModal?.currentModal?.vis_miles}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100,
                      ),
                      child: Image.asset(
                        'lib/assets/images/humidity_4181405.png',
                        cacheWidth: 50,
                        cacheHeight: 50,
                      ),
                    ),
                    Text(
                      "${pr.weatherModal?.currentModal?.humidity}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100,
                      ),
                      child: Image.asset(
                        'lib/assets/images/wind_5024369.png',
                        cacheWidth: 50,
                        cacheHeight: 50,
                      ),
                    ),
                    Text(
                      "${pr.weatherModal?.currentModal?.wind_kph}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Today",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    pr.checkIsSelected(false);
                    Navigator.pushNamed(
                      context,
                      'weather',
                    );
                  },
                  child: const Text(
                    "Next 7 Days >",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  pw.weatherModal?.forcastModal?.forecastday?[0].hour?.length ??
                      0,
              itemBuilder: (BuildContext context, int hourIndex) {
                return Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          "${pr.weatherModal?.forcastModal?.forecastday?[0].hour?[hourIndex].time}",
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.network(
                            'http:${pr.weatherModal?.forcastModal?.forecastday?[0].hour?[hourIndex].hourConditionModal?.icon}',
                          )),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          "${pr.weatherModal?.forcastModal?.forecastday?[0].hour?[hourIndex].temp_c}",
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
