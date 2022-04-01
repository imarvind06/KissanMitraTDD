import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/utils/size_config.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';

class CurrentExtraData extends StatelessWidget {
  CurrentWeather currentWeather;
  CurrentExtraData(this.currentWeather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              currentWeather.wind.toString() + " Km/h",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenHeight(16)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Wind",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black54,
                fontSize: getProportionateScreenHeight(16),
              ),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.drop,
              color: Colors.white,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              currentWeather.humidity.toString() + " %",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenHeight(16)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Humidity",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black54,
                  fontSize: getProportionateScreenHeight(16)),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.cloud_rain,
              color: Colors.white,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              currentWeather.chanceRain.toString() + " %",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenHeight(16)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Rain",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black54,
                  fontSize: getProportionateScreenHeight(16)),
            )
          ],
        )
      ],
    );
  }
}
