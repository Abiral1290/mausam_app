import 'dart:convert';
import 'dart:developer';

import 'package:mausamapp/repository/weather_repository/weather_repository.dart';

class WeatherApiServices{

  Future<Weather> getJobseekerProfile() async {
    final response = await HttpRequests.requestGet('');
    final jsonDecoded = json.decode(response.body);
    log(response.body);
    return Weather
        .fromJson(jsonDecoded);
  }

}