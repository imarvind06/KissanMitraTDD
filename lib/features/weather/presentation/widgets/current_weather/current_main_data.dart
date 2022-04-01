import 'package:flutter/material.dart';
import 'package:weather/core/utils/size_config.dart';
import 'package:weather/features/weather/domain/entities/current_weather/current_weather.dart';

class CurrentMainData extends StatelessWidget {
  CurrentWeather currentWeather;
  CurrentMainData(this.currentWeather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        Image(
          image: AssetImage(currentWeather.image),
          width: getProportionateScreenWidth(250),
          height: getProportionateScreenHeight(250),
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
              child: Column(
            children: [
              text(120, currentWeather.current.toString()),
              /* + "\u00B0"*/
              text(25, currentWeather.name),
              text(18, currentWeather.day),
            ],
          )),
        )
      ],
    );
  }

  Widget text(double height, String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        decoration: TextDecoration.none,
        fontSize: getProportionateScreenHeight(height),
      ),
    );
  }
}
