import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/weather_provider.dart';
import 'package:flutter_application_1/screens/city/views/city_page.dart';
import 'package:flutter_application_1/screens/days/views/future_weather_page.dart';
import 'package:flutter_application_1/screens/home/views/home_page.dart';
import 'package:flutter_application_1/screens/onecity/views/onecity_page.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(providers: [
     ChangeNotifierProvider(create: (context) => WeatherProvider(),)
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        listTileTheme: const ListTileThemeData(
          
        ),
        colorSchemeSeed: Colors.white
      ),
      debugShowCheckedModeBanner: false,
       routes: {
        '/': (context) => const HomePage(),
        'weather': (context) => const FutureWeatherPage(),
        'cities': (context) => const CityPage(),
        'onecity': (context) => const OnecityPage()
       },
    );
  }
}