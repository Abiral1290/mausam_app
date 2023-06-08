
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mausamapp/repository/weather_repository/src/weatherRepository.dart';
import 'package:mausamapp/repository/weather_repository/weather_repository.dart';

enum Status { init, loading, success, error }

class WeatherController extends ChangeNotifier{

  Weather? weather;
  WeatherRepository? _weatherRepository;
  DateTime datetime = DateTime.now();
  LocationData? location;


  WeatherController(){
    getLocation();
    fetchWeather();
  }

  void getLocation()async{
    location= await Location.instance.getLocation();
    log('my weather lat${location!.latitude.toString()}');
  }


  fetchWeather()async{
    WeatherRepository? weatherRepository = WeatherRepository();
    weather = await weatherRepository.getWeather();
    weatherRepository.getWeather().then((value) => weather ==value);

    notifyListeners();
  }
}