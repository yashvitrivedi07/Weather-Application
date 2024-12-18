import 'package:flutter/material.dart';
import 'package:flutter_application_1/modal/weather_modal.dart';
import 'package:flutter_application_1/provider/weather_provider.dart';
import 'package:provider/provider.dart';

class FutureWeatherPage extends StatefulWidget {
  const FutureWeatherPage({super.key});

  @override
  State<FutureWeatherPage> createState() => _FutureWeatherPageState();
}

class _FutureWeatherPageState extends State<FutureWeatherPage> {
  @override
  void initState() {
    super.initState();

    context
        .read<WeatherProvider>()
        .getWeatherData(context.read<WeatherProvider>().cityName!);
  }

  @override
  Widget build(BuildContext context) {
    var pw = context.watch<WeatherProvider>();
    var pr = context.read<WeatherProvider>();
    WeatherModal? modal = pw.isSelected == true
        ? ModalRoute.of(context)?.settings.arguments as WeatherModal
        : null;

    int selectedIndex = pr.selectedIndex;

    return Scaffold(
      backgroundColor: const Color(0xff7cadfd),
      appBar: AppBar(
        title: const Text("Future Weather"),
      ),
      body: pw.isSelected == false
          ? Stack(
              fit: StackFit.expand,
              children: [
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "ADD CITY",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          pr.weatherModal?.forcastModal?.forecastday?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              pr.updateSelectedIndex(index);
                            },
                            child: Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "${pr.weatherModal?.forcastModal?.forecastday?[index].date}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 170,
                  left: MediaQuery.of(context).size.width / 2 - 150,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffaacaf9),
                          Color(0xffa4c4f7),
                          Color(0xff95bcfb),
                          Color(0xff94bbfe),
                          Color(0xff7cadfd),
                          Color(0xff5896fd),
                          Color(0xff749ce1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'lib/assets/images/8f53cd5b-829a-4722-bc1f-6d583141cdf6.png',
                              height: 50,
                              width: 50,
                            ),
                            Text(
                              "${pr.weatherModal?.forcastModal?.forecastday?[selectedIndex].dayModal?.dayConditionModal?.text}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            const Text(
                              "Tonight",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${pr.weatherModal?.forcastModal?.forecastday?[selectedIndex].dayModal?.avgtemp_c}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ),
                            const Text(
                              "Feels like 32",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount:
                          pw.weatherModal?.forcastModal?.forecastday?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              "${pr.weatherModal?.forcastModal?.forecastday?[index].dayModal?.avgtemp_c}",
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "ADD CITY",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: modal?.forcastModal?.forecastday?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              pr.updateSelectedIndex(index);
                            },
                            child: Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "${modal?.forcastModal?.forecastday?[index].date}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 170,
                  left: MediaQuery.of(context).size.width / 2 - 150,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffaacaf9),
                          Color(0xffa4c4f7),
                          Color(0xff95bcfb),
                          Color(0xff94bbfe),
                          Color(0xff7cadfd),
                          Color(0xff5896fd),
                          Color(0xff749ce1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'lib/assets/images/8f53cd5b-829a-4722-bc1f-6d583141cdf6.png',
                              height: 50,
                              width: 50,
                            ),
                            Text(
                              "${modal?.forcastModal?.forecastday?[selectedIndex].dayModal?.dayConditionModal?.text}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            const Text(
                              "Tonight",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${modal?.forcastModal?.forecastday?[selectedIndex].dayModal?.avgtemp_c}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ),
                            const Text(
                              "Feels like 32",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount:
                          pw.weatherModal?.forcastModal?.forecastday?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              "${modal?.forcastModal?.forecastday?[index].dayModal?.avgtemp_c}",
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
