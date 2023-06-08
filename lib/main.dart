
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mausamapp/utilities/constants.dart';
import 'package:mausamapp/utilities/themeExtension.dart';
import 'package:mausamapp/view/homepage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';

import 'package:provider/provider.dart';

import 'controller/weatherController.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  LocationData? location;
  if (defaultTargetPlatform == TargetPlatform.android){

    if(await Permission.location.isGranted){

    }else{
      Permission.location.request();
    }

  }
  else {
  }

  location= await Location.instance.getLocation();
  log('my weather lat${location.latitude.toString()}');
  Constants.latitude = location.latitude.toString();
  Constants.longitude = location.longitude.toString();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<WeatherController>(create: (_) => WeatherController()),
        ],
        child: MyApp(),
      )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: lightTheme,
        color: const Color(0xFF0F1320),
      home:const HomePage(),
    );
  }
}

