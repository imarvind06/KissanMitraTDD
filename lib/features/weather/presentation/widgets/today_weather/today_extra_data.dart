import 'package:flutter/material.dart';
import 'package:weather/core/utils/size_config.dart';
import 'package:weather/features/weather/domain/entities/today_weather/today_weather.dart';

class TodayExtraData extends StatelessWidget {
  TodayWeather todayWeather;
  TodayExtraData(this.todayWeather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius:
              BorderRadius.circular(getProportionateScreenHeight(35))),
      child: Column(
        children: [
          Text(
            todayWeather.current.toString() + "\u00B0",
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: getProportionateScreenWidth(20)),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Image(
            image: AssetImage(todayWeather.image),
            width: getProportionateScreenWidth(50),
            height: getProportionateScreenHeight(50),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Text(
            todayWeather.time,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: getProportionateScreenHeight(16),
                color: Colors.grey),
          )
        ],
      ),
    );
  }
}
