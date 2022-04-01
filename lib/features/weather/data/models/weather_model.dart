import 'package:intl/intl.dart';
import 'package:weather/core/utils/find_icon.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather_data.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather_data.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather_data.dart';
import 'package:weather/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required CurrentWeatherData currentWeatherData,
    required SevenDayWeatherData sevenDayWeatherData,
    required TodayWeatherData todayWeatherData,
  }) : super(
          currentWeatherData: currentWeatherData,
          sevenDayWeatherData: sevenDayWeatherData,
          todayWeatherData: todayWeatherData,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    DateTime date = DateTime.now();
    var current = json["current"];

    CurrentWeather currentTemp = CurrentWeather(
      current: current["temp"].round(),
      name: current["weather"][0]["main"].toString(),
      day: DateFormat("EEEE dd MMMM").format(date),
      wind: current["wind_speed"]?.round(),
      humidity: current["humidity"]?.round(),
      chanceRain: current["uvi"]?.round(),
      image: findIcon(current["weather"][0]["main"].toString(), true),
    );

    List<TodayWeather> todayWeather = [];
    int hour = int.parse(DateFormat("hh").format(date));
    for (var i = 0; i < 4; i++) {
      var temp = json["hourly"];
      var hourly = TodayWeather(
          current: temp[i]["temp"].round(),
          image: findIcon(temp[i]["weather"][0]["main"].toString(), false),
          time: Duration(hours: hour + i + 1).toString().split(":")[0] + ":00");
      todayWeather.add(hourly);
    }

    List<SevenDayWeather> sevenDay = [];
    for (var i = 0; i < 7; i++) {
      String day = DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + i + 1))
          .substring(0, 3);
      var temp = json["daily"][i];
      var hourly = SevenDayWeather(
        max: temp["temp"]["max"].round(),
        min: temp["temp"]["min"].round(),
        image: findIcon(temp["weather"][0]["main"].toString(), false),
        name: temp["weather"][0]["main"].toString(),
        day: day,
      );
      sevenDay.add(hourly);
    }

    return WeatherModel(
        currentWeatherData: CurrentWeatherData(currentWeatherData: currentTemp),
        sevenDayWeatherData: SevenDayWeatherData(sevenDayWeatherdata: sevenDay),
        todayWeatherData: TodayWeatherData(todayWeatherData: todayWeather));
  }
}
