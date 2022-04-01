import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/core/utils/size_config.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather_data.dart';
import 'package:weather/features/weather/presentation/widgets/today_weather/today_extra_data.dart';

class TodaysWeatherView extends StatelessWidget {
  TodayWeatherData todayWeatherData;
  TodaysWeatherView(this.todayWeatherData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Todays Weather",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  TodayExtraData(todayWeatherData.todayWeatherData[0]),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  TodayExtraData(todayWeatherData.todayWeatherData[1]),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  TodayExtraData(todayWeatherData.todayWeatherData[2]),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  TodayExtraData(todayWeatherData.todayWeatherData[3])
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "7 days Weather",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: getProportionateScreenHeight(25),
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
