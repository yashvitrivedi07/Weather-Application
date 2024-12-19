class WeatherModal {
  LocationModal? locationModal = LocationModal();
  CurrentModal? currentModal = CurrentModal();
  ForcastModal? forcastModal = ForcastModal();

  WeatherModal({this.currentModal, this.locationModal, this.forcastModal});

  factory WeatherModal.mapToModal(Map m) {
    return WeatherModal(
        forcastModal: ForcastModal.mapToModal(m['forecast']),
        currentModal: CurrentModal.mapToModal(m['current']),
        locationModal: LocationModal.mapToModal(m['location']));
  }
}

class LocationModal {
  String? name, country, localtime;

  LocationModal({this.name, this.country, this.localtime});

  factory LocationModal.mapToModal(Map m) {
    return LocationModal(
        name: m['name'], country: m['country'], localtime: m['localtime']);
  }
}

class CurrentModal {
  double? temp_c, wind_kph, pressure_mb, feelslike_c, vis_miles, uv;
  int? is_day, wind_degree, humidity;
  ConditionModal? conditionModal = ConditionModal();

  CurrentModal(
      {this.feelslike_c,
      this.humidity,
      this.is_day,
      this.pressure_mb,
      this.temp_c,
      this.uv,
      this.vis_miles,
      this.wind_degree,
      this.wind_kph,
      this.conditionModal});

  factory CurrentModal.mapToModal(Map m) {
    return CurrentModal(
        feelslike_c: m['feelslike_c'],
        humidity: m['humidity'],
        is_day: m['is_day'],
        pressure_mb: m['pressure_mb'],
        temp_c: m['temp_c'],
        uv: m['uv'],
        vis_miles: m['vis_miles'],
        wind_degree: m['wind_degree'],
        wind_kph: m['wind_kph'],
        conditionModal: ConditionModal.mapToModal(m['condition']));
  }
}

class ConditionModal {
  String? text, icon;
  ConditionModal({this.text, this.icon});

  factory ConditionModal.mapToModal(Map m) {
    return ConditionModal(text: m['text'], icon: m['icon']);
  }
}

class ForcastModal {
  List<ForcastdayModal>? forecastday = [];

  ForcastModal({this.forecastday});

  factory ForcastModal.mapToModal(Map m) {
    List day = m['forecastday'];
    return ForcastModal(
        forecastday: day.map((e) => ForcastdayModal.mapToModal(e)).toList());
  }
}

class ForcastdayModal {
  String? date;
  DayModal? dayModal = DayModal();
  AstroModal? astroModal = AstroModal();
  List<HourModal>? hour = [];
  ForcastdayModal({this.date, this.astroModal, this.hour, this.dayModal});

  factory ForcastdayModal.mapToModal(Map m) {
    List h = m['hour'];
    return ForcastdayModal(
        dayModal: DayModal.mapToModal(m['day']),
        date: m['date'],
        astroModal: AstroModal.mapToModal(m['astro']),
        hour: h.map((e) => HourModal.mapToModal(e)).toList());
  }
}

class DayModal {
  double? maxtemp_c, mintemp_c, avgtemp_c;
  DayConditionModal? dayConditionModal = DayConditionModal();

  DayModal(
      {this.avgtemp_c, this.maxtemp_c, this.mintemp_c, this.dayConditionModal});

  factory DayModal.mapToModal(Map m) {
    return DayModal(
        avgtemp_c: m['avgtemp_c'],
        maxtemp_c: m['maxtemp_c'],
        mintemp_c: m['mintemp_c'],
        dayConditionModal: DayConditionModal.mapToModal(m['condition']));
  }
}

class DayConditionModal {
  String? text, icon;

  DayConditionModal({this.text, this.icon});

  factory DayConditionModal.mapToModal(Map m) {
    return DayConditionModal(text: m['text'], icon: m['icon']);
  }
}

class AstroModal {
  String? sunrise, sunset;

  AstroModal({this.sunrise, this.sunset});

  factory AstroModal.mapToModal(Map m) {
    return AstroModal(sunrise: m['sunrise'], sunset: m['sunset']);
  }
}

class HourModal {
  String? time;
  double? temp_f, temp_c;
  int? is_day;
  HourConditionModal? hourConditionModal = HourConditionModal();

  HourModal(
      {this.is_day,
      this.temp_f,
      this.time,
      this.temp_c,
      this.hourConditionModal});

  factory HourModal.mapToModal(Map m) {
    return HourModal(
        hourConditionModal: HourConditionModal.mapToModal(m['condition']),
        is_day: m['is_day'],
        temp_f: m['temp_f'],
        time: m['time'],
        temp_c: m['temp_c']);
  }
}

class HourConditionModal {
  String? text, icon;
  HourConditionModal({this.text, this.icon});
  factory HourConditionModal.mapToModal(Map m) {
    return HourConditionModal(text: m['text'], icon: m['icon']);
  }
}



// {
//     // "location": {
//     //     "name": "Surat",   <=
//     //     "region": "Gujarat",
//     //     "country": "India",
//     //     "lat": 20.9667,
//     //     "lon": 72.9,
//     //     "tz_id": "Asia/Kolkata",
//     //     "localtime_epoch": 1734110656,
//     //     "localtime": "2024-12-13 22:54"   <=
//     // },
//     // "current": {
//     //     "last_updated_epoch": 1734110100,
//     //     "last_updated": "2024-12-13 22:45",
//     //     "temp_c": 21.1,    <=
//     //     "temp_f": 70.0,      <=
//     //     "is_day": 0,       <=
//     //     // "condition": {
//     //     //     "text": "Clear",    <=
//     //     //     "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//     //     //     "code": 1000
//     //     // },
//     //     "wind_mph": 11.4,      
//     //     "wind_kph": 18.4,      <=
//     //     "wind_degree": 47,     <=
//     //     "wind_dir": "NE",
//     //     "pressure_mb": 1015.0,   <=
//     //     "pressure_in": 29.97,
//     //     "precip_mm": 0.0,
//     //     "precip_in": 0.0,
//     //     "humidity": 35,     <=
//     //     "cloud": 0,         <=
//     //     "feelslike_c": 21.1,    <=
//     //     "feelslike_f": 70.0,      <=
//     //     "windchill_c": 21.1,
//     //     "windchill_f": 70.0,
//     //     "heatindex_c": 23.5,
//     //     "heatindex_f": 74.3,
//     //     "dewpoint_c": 5.2,
//     //     "dewpoint_f": 41.3,
//     //     "vis_km": 10.0,    
//     //     "vis_miles": 6.0,   <=
//     //     "uv": 0.0,     <=
//     //     "gust_mph": 24.0,
//     //     "gust_kph": 38.6
//     // },
//     "forecast": {
//         "forecastday": [
//             {
//                 "date": "2024-12-13",       <=
//                 "date_epoch": 1734048000,
//                 "day": {
//                     "maxtemp_c": 29.0,
//                     "maxtemp_f": 84.1,
//                     "mintemp_c": 18.7,
//                     "mintemp_f": 65.7,
//                     "avgtemp_c": 23.0,
//                     "avgtemp_f": 73.3,
//                     "maxwind_mph": 13.2,
//                     "maxwind_kph": 21.2,
//                     "totalprecip_mm": 0.0,
//                     "totalprecip_in": 0.0,
//                     "totalsnow_cm": 0.0,
//                     "avgvis_km": 10.0,
//                     "avgvis_miles": 6.0,
//                     "avghumidity": 41,
//                     "daily_will_it_rain": 0,
//                     "daily_chance_of_rain": 0,
//                     "daily_will_it_snow": 0,
//                     "daily_chance_of_snow": 0,
//                     "condition": {
//                         "text": "Sunny",
//                         "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                         "code": 1000
//                     },
//                     "uv": 1.3
//                 },
//                 "astro": {
//                     "sunrise": "07:07 AM",              <=
//                     "sunset": "05:59 PM",                <=
//                     "moonrise": "04:01 PM",
//                     "moonset": "04:45 AM",
//                     "moon_phase": "Waxing Gibbous",
//                     "moon_illumination": 92,
//                     "is_moon_up": 1,
//                     "is_sun_up": 0
//                 },
//                 "hour": [
//                     {
//                         "time_epoch": 1734028200,
//                         "time": "2024-12-13 00:00",      <=
//                         "temp_c": 20.1,            <=
//                         "temp_f": 68.2,             <=
//                         "is_day": 0,               <=
//                         "condition": {
//                             "text": "Clear ",      <=
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 10.3,    <=
//                         "wind_kph": 16.6,     <=
//                         "wind_degree": 24,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1014.0,
//                         "pressure_in": 29.93,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 43,     <=
//                         "cloud": 0,     <=
//                         "feelslike_c": 20.1,   <=
//                         "feelslike_f": 68.2,   
//                         "windchill_c": 20.1,
//                         "windchill_f": 68.2,
//                         "heatindex_c": 20.1,
//                         "heatindex_f": 68.2,
//                         "dewpoint_c": 7.0,
//                         "dewpoint_f": 44.7,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,   
//                         "vis_miles": 6.0,
//                         "gust_mph": 19.4,
//                         "gust_kph": 31.2,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734031800,
//                         "time": "2024-12-13 01:00",
//                         "temp_c": 19.7,
//                         "temp_f": 67.5,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 10.1,
//                         "wind_kph": 16.2,
//                         "wind_degree": 27,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1013.0,
//                         "pressure_in": 29.91,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 45,
//                         "cloud": 0,
//                         "feelslike_c": 19.7,
//                         "feelslike_f": 67.5,
//                         "windchill_c": 19.7,
//                         "windchill_f": 67.5,
//                         "heatindex_c": 19.7,
//                         "heatindex_f": 67.5,
//                         "dewpoint_c": 7.5,
//                         "dewpoint_f": 45.4,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 19.8,
//                         "gust_kph": 31.9,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734035400,
//                         "time": "2024-12-13 02:00",
//                         "temp_c": 19.6,
//                         "temp_f": 67.2,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 9.8,
//                         "wind_kph": 15.8,
//                         "wind_degree": 29,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1013.0,
//                         "pressure_in": 29.92,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 52,
//                         "cloud": 0,
//                         "feelslike_c": 19.6,
//                         "feelslike_f": 67.2,
//                         "windchill_c": 19.6,
//                         "windchill_f": 67.2,
//                         "heatindex_c": 19.6,
//                         "heatindex_f": 67.2,
//                         "dewpoint_c": 9.4,
//                         "dewpoint_f": 48.8,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 19.9,
//                         "gust_kph": 32.1,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734039000,
//                         "time": "2024-12-13 03:00",
//                         "temp_c": 19.4,
//                         "temp_f": 67.0,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 10.3,
//                         "wind_kph": 16.6,
//                         "wind_degree": 32,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1013.0,
//                         "pressure_in": 29.91,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 53,
//                         "cloud": 0,
//                         "feelslike_c": 19.4,
//                         "feelslike_f": 67.0,
//                         "windchill_c": 19.4,
//                         "windchill_f": 67.0,
//                         "heatindex_c": 19.4,
//                         "heatindex_f": 67.0,
//                         "dewpoint_c": 9.7,
//                         "dewpoint_f": 49.4,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 20.2,
//                         "gust_kph": 32.5,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734042600,
//                         "time": "2024-12-13 04:00",
//                         "temp_c": 19.2,
//                         "temp_f": 66.6,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.2,
//                         "wind_kph": 18.0,
//                         "wind_degree": 36,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1013.0,
//                         "pressure_in": 29.91,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 53,
//                         "cloud": 0,
//                         "feelslike_c": 19.2,
//                         "feelslike_f": 66.6,
//                         "windchill_c": 19.2,
//                         "windchill_f": 66.6,
//                         "heatindex_c": 19.2,
//                         "heatindex_f": 66.6,
//                         "dewpoint_c": 9.5,
//                         "dewpoint_f": 49.1,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 21.6,
//                         "gust_kph": 34.8,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734046200,
//                         "time": "2024-12-13 05:00",
//                         "temp_c": 19.1,
//                         "temp_f": 66.4,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.4,
//                         "wind_kph": 18.4,
//                         "wind_degree": 40,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1013.0,
//                         "pressure_in": 29.92,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 52,
//                         "cloud": 0,
//                         "feelslike_c": 19.1,
//                         "feelslike_f": 66.4,
//                         "windchill_c": 19.1,
//                         "windchill_f": 66.4,
//                         "heatindex_c": 19.1,
//                         "heatindex_f": 66.4,
//                         "dewpoint_c": 8.9,
//                         "dewpoint_f": 48.0,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 22.1,
//                         "gust_kph": 35.6,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734049800,
//                         "time": "2024-12-13 06:00",
//                         "temp_c": 18.8,
//                         "temp_f": 65.9,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 12.1,
//                         "wind_kph": 19.4,
//                         "wind_degree": 43,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1014.0,
//                         "pressure_in": 29.94,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 50,
//                         "cloud": 0,
//                         "feelslike_c": 18.8,
//                         "feelslike_f": 65.9,
//                         "windchill_c": 18.8,
//                         "windchill_f": 65.9,
//                         "heatindex_c": 18.8,
//                         "heatindex_f": 65.9,
//                         "dewpoint_c": 8.3,
//                         "dewpoint_f": 46.9,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 23.4,
//                         "gust_kph": 37.6,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734053400,
//                         "time": "2024-12-13 07:00",
//                         "temp_c": 18.7,
//                         "temp_f": 65.7,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 13.0,
//                         "wind_kph": 20.9,
//                         "wind_degree": 41,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1015.0,
//                         "pressure_in": 29.96,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 49,
//                         "cloud": 0,
//                         "feelslike_c": 18.7,
//                         "feelslike_f": 65.7,
//                         "windchill_c": 18.7,
//                         "windchill_f": 65.7,
//                         "heatindex_c": 18.7,
//                         "heatindex_f": 65.7,
//                         "dewpoint_c": 8.0,
//                         "dewpoint_f": 46.3,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 24.5,
//                         "gust_kph": 39.4,
//                         "uv": 0.0
//                     },
//                     {
//                         "time_epoch": 1734057000,
//                         "time": "2024-12-13 08:00",
//                         "temp_c": 20.1,
//                         "temp_f": 68.2,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 12.8,
//                         "wind_kph": 20.5,
//                         "wind_degree": 52,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1016.0,
//                         "pressure_in": 29.99,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 46,
//                         "cloud": 0,
//                         "feelslike_c": 20.1,
//                         "feelslike_f": 68.2,
//                         "windchill_c": 20.1,
//                         "windchill_f": 68.2,
//                         "heatindex_c": 20.1,
//                         "heatindex_f": 68.2,
//                         "dewpoint_c": 8.0,
//                         "dewpoint_f": 46.5,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 19.7,
//                         "gust_kph": 31.6,
//                         "uv": 0.6
//                     },
//                     {
//                         "time_epoch": 1734060600,
//                         "time": "2024-12-13 09:00",
//                         "temp_c": 22.5,
//                         "temp_f": 72.6,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 13.2,
//                         "wind_kph": 21.2,
//                         "wind_degree": 62,
//                         "wind_dir": "ENE",
//                         "pressure_mb": 1016.0,
//                         "pressure_in": 30.01,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 42,
//                         "cloud": 0,
//                         "feelslike_c": 24.3,
//                         "feelslike_f": 75.7,
//                         "windchill_c": 22.5,
//                         "windchill_f": 72.6,
//                         "heatindex_c": 24.3,
//                         "heatindex_f": 75.7,
//                         "dewpoint_c": 9.0,
//                         "dewpoint_f": 48.3,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 16.8,
//                         "gust_kph": 27.0,
//                         "uv": 1.9
//                     },
//                     {
//                         "time_epoch": 1734064200,
//                         "time": "2024-12-13 10:00",
//                         "temp_c": 24.9,
//                         "temp_f": 76.8,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 12.5,
//                         "wind_kph": 20.2,
//                         "wind_degree": 64,
//                         "wind_dir": "ENE",
//                         "pressure_mb": 1016.0,
//                         "pressure_in": 30.0,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 39,
//                         "cloud": 0,
//                         "feelslike_c": 25.2,
//                         "feelslike_f": 77.4,
//                         "windchill_c": 24.9,
//                         "windchill_f": 76.8,
//                         "heatindex_c": 25.2,
//                         "heatindex_f": 77.4,
//                         "dewpoint_c": 10.1,
//                         "dewpoint_f": 50.1,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 14.9,
//                         "gust_kph": 24.0,
//                         "uv": 3.7
//                     },
//                     {
//                         "time_epoch": 1734067800,
//                         "time": "2024-12-13 11:00",
//                         "temp_c": 26.5,
//                         "temp_f": 79.8,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.9,
//                         "wind_kph": 19.1,
//                         "wind_degree": 61,
//                         "wind_dir": "ENE",
//                         "pressure_mb": 1015.0,
//                         "pressure_in": 29.97,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 38,
//                         "cloud": 0,
//                         "feelslike_c": 26.4,
//                         "feelslike_f": 79.4,
//                         "windchill_c": 26.5,
//                         "windchill_f": 79.8,
//                         "heatindex_c": 26.4,
//                         "heatindex_f": 79.4,
//                         "dewpoint_c": 11.0,
//                         "dewpoint_f": 51.8,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 13.9,
//                         "gust_kph": 22.3,
//                         "uv": 5.3
//                     },
//                     {
//                         "time_epoch": 1734071400,
//                         "time": "2024-12-13 12:00",
//                         "temp_c": 27.7,
//                         "temp_f": 81.9,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 10.3,
//                         "wind_kph": 16.6,
//                         "wind_degree": 58,
//                         "wind_dir": "ENE",
//                         "pressure_mb": 1013.0,
//                         "pressure_in": 29.93,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 36,
//                         "cloud": 0,
//                         "feelslike_c": 27.2,
//                         "feelslike_f": 81.0,
//                         "windchill_c": 27.7,
//                         "windchill_f": 81.9,
//                         "heatindex_c": 27.2,
//                         "heatindex_f": 81.0,
//                         "dewpoint_c": 11.3,
//                         "dewpoint_f": 52.4,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 12.3,
//                         "gust_kph": 19.9,
//                         "uv": 6.1
//                     },
//                     {
//                         "time_epoch": 1734075000,
//                         "time": "2024-12-13 13:00",
//                         "temp_c": 28.6,
//                         "temp_f": 83.4,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 9.6,
//                         "wind_kph": 15.5,
//                         "wind_degree": 46,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1012.0,
//                         "pressure_in": 29.89,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 34,
//                         "cloud": 0,
//                         "feelslike_c": 27.9,
//                         "feelslike_f": 82.1,
//                         "windchill_c": 28.6,
//                         "windchill_f": 83.4,
//                         "heatindex_c": 27.9,
//                         "heatindex_f": 82.1,
//                         "dewpoint_c": 11.2,
//                         "dewpoint_f": 52.2,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 11.9,
//                         "gust_kph": 19.2,
//                         "uv": 5.7
//                     },
//                     {
//                         "time_epoch": 1734078600,
//                         "time": "2024-12-13 14:00",
//                         "temp_c": 28.9,
//                         "temp_f": 84.0,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 9.4,
//                         "wind_kph": 15.1,
//                         "wind_degree": 44,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1011.0,
//                         "pressure_in": 29.86,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 33,
//                         "cloud": 0,
//                         "feelslike_c": 28.1,
//                         "feelslike_f": 82.6,
//                         "windchill_c": 28.9,
//                         "windchill_f": 84.0,
//                         "heatindex_c": 28.1,
//                         "heatindex_f": 82.6,
//                         "dewpoint_c": 11.0,
//                         "dewpoint_f": 51.9,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 12.2,
//                         "gust_kph": 19.6,
//                         "uv": 4.0
//                     },
//                     {
//                         "time_epoch": 1734082200,
//                         "time": "2024-12-13 15:00",
//                         "temp_c": 29.0,
//                         "temp_f": 84.1,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 10.1,
//                         "wind_kph": 16.2,
//                         "wind_degree": 35,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1011.0,
//                         "pressure_in": 29.85,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 32,
//                         "cloud": 0,
//                         "feelslike_c": 28.0,
//                         "feelslike_f": 82.5,
//                         "windchill_c": 29.0,
//                         "windchill_f": 84.1,
//                         "heatindex_c": 28.0,
//                         "heatindex_f": 82.5,
//                         "dewpoint_c": 10.5,
//                         "dewpoint_f": 50.9,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 13.9,
//                         "gust_kph": 22.3,
//                         "uv": 2.2
//                     },
//                     {
//                         "time_epoch": 1734085800,
//                         "time": "2024-12-13 16:00",
//                         "temp_c": 28.3,
//                         "temp_f": 83.0,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.4,
//                         "wind_kph": 18.4,
//                         "wind_degree": 24,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1011.0,
//                         "pressure_in": 29.85,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 33,
//                         "cloud": 0,
//                         "feelslike_c": 27.5,
//                         "feelslike_f": 81.5,
//                         "windchill_c": 28.3,
//                         "windchill_f": 83.0,
//                         "heatindex_c": 27.5,
//                         "heatindex_f": 81.5,
//                         "dewpoint_c": 10.3,
//                         "dewpoint_f": 50.6,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 17.3,
//                         "gust_kph": 27.8,
//                         "uv": 0.9
//                     },
//                     {
//                         "time_epoch": 1734089400,
//                         "time": "2024-12-13 17:00",
//                         "temp_c": 26.4,
//                         "temp_f": 79.6,
//                         "is_day": 1,
//                         "condition": {
//                             "text": "Sunny",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.4,
//                         "wind_kph": 18.4,
//                         "wind_degree": 26,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1011.0,
//                         "pressure_in": 29.87,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 35,
//                         "cloud": 0,
//                         "feelslike_c": 26.1,
//                         "feelslike_f": 78.9,
//                         "windchill_c": 26.4,
//                         "windchill_f": 79.6,
//                         "heatindex_c": 26.1,
//                         "heatindex_f": 78.9,
//                         "dewpoint_c": 9.7,
//                         "dewpoint_f": 49.5,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 20.8,
//                         "gust_kph": 33.5,
//                         "uv": 0.2
//                     },
//                     {
//                         "time_epoch": 1734093000,
//                         "time": "2024-12-13 18:00",
//                         "temp_c": 24.4,
//                         "temp_f": 75.9,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 10.5,
//                         "wind_kph": 16.9,
//                         "wind_degree": 30,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1012.0,
//                         "pressure_in": 29.89,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 36,
//                         "cloud": 0,
//                         "feelslike_c": 24.8,
//                         "feelslike_f": 76.6,
//                         "windchill_c": 24.4,
//                         "windchill_f": 75.9,
//                         "heatindex_c": 24.8,
//                         "heatindex_f": 76.6,
//                         "dewpoint_c": 8.3,
//                         "dewpoint_f": 47.0,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 21.9,
//                         "gust_kph": 35.2,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734096600,
//                         "time": "2024-12-13 19:00",
//                         "temp_c": 23.3,
//                         "temp_f": 74.0,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.4,
//                         "wind_kph": 18.4,
//                         "wind_degree": 24,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1014.0,
//                         "pressure_in": 29.93,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 36,
//                         "cloud": 0,
//                         "feelslike_c": 24.2,
//                         "feelslike_f": 75.6,
//                         "windchill_c": 23.3,
//                         "windchill_f": 74.0,
//                         "heatindex_c": 24.2,
//                         "heatindex_f": 75.6,
//                         "dewpoint_c": 7.4,
//                         "dewpoint_f": 45.3,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 24.0,
//                         "gust_kph": 38.6,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734100200,
//                         "time": "2024-12-13 20:00",
//                         "temp_c": 22.3,
//                         "temp_f": 72.2,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.9,
//                         "wind_kph": 19.1,
//                         "wind_degree": 23,
//                         "wind_dir": "NNE",
//                         "pressure_mb": 1014.0,
//                         "pressure_in": 29.96,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 37,
//                         "cloud": 0,
//                         "feelslike_c": 23.9,
//                         "feelslike_f": 75.0,
//                         "windchill_c": 22.3,
//                         "windchill_f": 72.2,
//                         "heatindex_c": 23.9,
//                         "heatindex_f": 75.0,
//                         "dewpoint_c": 6.8,
//                         "dewpoint_f": 44.3,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 24.7,
//                         "gust_kph": 39.7,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734103800,
//                         "time": "2024-12-13 21:00",
//                         "temp_c": 21.6,
//                         "temp_f": 71.0,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.4,
//                         "wind_kph": 18.4,
//                         "wind_degree": 34,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1015.0,
//                         "pressure_in": 29.97,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 36,
//                         "cloud": 0,
//                         "feelslike_c": 21.7,
//                         "feelslike_f": 71.0,
//                         "windchill_c": 21.7,
//                         "windchill_f": 71.0,
//                         "heatindex_c": 23.7,
//                         "heatindex_f": 74.6,
//                         "dewpoint_c": 6.0,
//                         "dewpoint_f": 42.9,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 24.0,
//                         "gust_kph": 38.6,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734107400,
//                         "time": "2024-12-13 22:00",
//                         "temp_c": 21.1,
//                         "temp_f": 70.0,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.4,
//                         "wind_kph": 18.4,
//                         "wind_degree": 47,
//                         "wind_dir": "NE",
//                         "pressure_mb": 1015.0,
//                         "pressure_in": 29.97,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 35,
//                         "cloud": 0,
//                         "feelslike_c": 21.1,
//                         "feelslike_f": 70.0,
//                         "windchill_c": 21.1,
//                         "windchill_f": 70.0,
//                         "heatindex_c": 23.5,
//                         "heatindex_f": 74.3,
//                         "dewpoint_c": 5.2,
//                         "dewpoint_f": 41.3,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 24.0,
//                         "gust_kph": 38.6,
//                         "uv": 0
//                     },
//                     {
//                         "time_epoch": 1734111000,
//                         "time": "2024-12-13 23:00",
//                         "temp_c": 20.7,
//                         "temp_f": 69.3,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Clear ",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//                             "code": 1000
//                         },
//                         "wind_mph": 11.4,
//                         "wind_kph": 18.4,
//                         "wind_degree": 56,
//                         "wind_dir": "ENE",
//                         "pressure_mb": 1015.0,
//                         "pressure_in": 29.96,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "snow_cm": 0.0,
//                         "humidity": 34,
//                         "cloud": 0,
//                         "feelslike_c": 20.7,
//                         "feelslike_f": 69.3,
//                         "windchill_c": 20.7,
//                         "windchill_f": 69.3,
//                         "heatindex_c": 20.7,
//                         "heatindex_f": 69.3,
//                         "dewpoint_c": 4.2,
//                         "dewpoint_f": 39.6,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 24.0,
//                         "gust_kph": 38.6,
//                         "uv": 0
//                     }
//                 ]
//             }
//         ]
//     }
// }