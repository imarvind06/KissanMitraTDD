import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utils/size_config.dart';
import 'package:weather/features/map/presentation/pages/map_page.dart';
import 'package:weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/widgets/current_weather/current_weather_view.dart';
import 'package:weather/features/weather/presentation/widgets/empty_or_loading.dart';
import 'package:weather/features/weather/presentation/widgets/seven_day_weather/seven_day_weathet_view.dart';
import 'package:weather/features/weather/presentation/widgets/today_weather/today_weather_view.dart';
import 'package:weather/injection_container.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapPage(),
            ),
          );
        },
        child: Icon(
          Icons.map,
          size: getProportionateScreenHeight(30),
          color: Colors.white,
        ),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<WeatherBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl(),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is Empty) {
            context.read<WeatherBloc>().add(GetWeatherForLatLong());
            return const EmptyOrLoading();
          } else if (state is Loading) {
            return const EmptyOrLoading();
          } else if (state is Loaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CurrentWeatherView(
                      state.weather.currentWeatherData.currentWeatherData),
                  TodaysWeatherView(state.weather.todayWeatherData),
                  SevenDaysView(state.weather.sevenDayWeatherData),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Some Error occured",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
