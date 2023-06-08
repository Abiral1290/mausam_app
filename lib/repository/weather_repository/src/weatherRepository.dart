import 'package:mausamapp/repository/weather_repository/weather_repository.dart';
class WeatherRepository{


  final WeatherApiServices _weatherApiServices;


  WeatherRepository({WeatherApiServices? weatherApiServices})
      : _weatherApiServices = weatherApiServices ?? WeatherApiServices();

  Future<Weather> getWeather() async {
    final resp = await _weatherApiServices.getJobseekerProfile();
    return resp;
  }
}