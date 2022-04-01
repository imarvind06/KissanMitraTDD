import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/features/weather/domain/entities/seven_day_weather/seven_day_weather_data.dart';
import 'package:weather/features/weather/presentation/widgets/seven_day_weather/seven_day_extra_data.dart';

class SevenDaysView extends StatelessWidget {
  SevenDayWeatherData sevenDayWeatherData;
  SevenDaysView(this.sevenDayWeatherData, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SevenDayExtraData(sevenDayWeatherData.sevenDayWeatherdata[0]),
        SevenDayExtraData(sevenDayWeatherData.sevenDayWeatherdata[1]),
        SevenDayExtraData(sevenDayWeatherData.sevenDayWeatherdata[2]),
        SevenDayExtraData(sevenDayWeatherData.sevenDayWeatherdata[3]),
        SevenDayExtraData(sevenDayWeatherData.sevenDayWeatherdata[4]),
        SevenDayExtraData(sevenDayWeatherData.sevenDayWeatherdata[5]),
        SevenDayExtraData(sevenDayWeatherData.sevenDayWeatherdata[6]),
      ],
    );
  }
}
