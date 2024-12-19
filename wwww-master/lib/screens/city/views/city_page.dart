import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/weather_provider.dart';
import 'package:provider/provider.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pw = context.watch<WeatherProvider>();
    var pr = context.read<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cities"),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      pr.getCityName(cityController.text);
                      Navigator.pushNamed(context, 'onecity');
                    },
                    icon: const Icon(Icons.search),
                  ),
                  border: const OutlineInputBorder(),
                  hintText: "Enter city",
                ),
              ),
            ),
          ),
          if (pw.cities.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Enter a city to view results."),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: pw.cities.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: pr.colorList[index % 4],
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "${pr.cities[index].locationModal?.name}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "${pr.cities[index].currentModal?.conditionModal?.text}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "${pr.cities[index].currentModal?.temp_c}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    pr.removeCity(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
