import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/utils/size_config.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';
import 'package:weather/features/weather/presentation/widgets/current_weather/current_extra_data.dart';
import 'package:weather/features/weather/presentation/widgets/current_weather/current_main_data.dart';

class CurrentWeatherView extends StatelessWidget {
  CurrentWeather currentWeather;
  CurrentWeatherView(this.currentWeather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getProportionateScreenHeight(550),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(getProportionateScreenWidth(50)),
              bottomRight: Radius.circular(getProportionateScreenWidth(50)))),
      child: Column(
        children: [
          CurrentMainData(currentWeather),
          const Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          CurrentExtraData(currentWeather),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      ),
    );
  }
}
