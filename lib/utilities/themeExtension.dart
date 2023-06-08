import 'package:flutter/material.dart';

class OwnThemeFields {
  final TextStyle extraLarge48;
  final TextStyle extraLarge48_1;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;

  Size sizes(BuildContext context) => MediaQuery.of(context).size;



  OwnThemeFields({


    this.extraLarge48_1 = const TextStyle(
      fontSize: 28,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFCF24),
      height: 48 / 32,
      letterSpacing: 0,
    ),
    this.h1 = const TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color:   Color(0xFF2278D4),
      height: 39 / 26,
      letterSpacing: 0,
    ),
    this.h2 = const TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color:   Color(0xFFE20613),
      height: 39 / 26,
      letterSpacing: 0,
    ),
    this.extraLarge48 = const TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color:   Color(0xFFFFFFFF),
      height: 39 / 26,
      letterSpacing: 0,
    ),

    this.h3 = const TextStyle(
      fontSize: 10,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 33 / 22,
      color:   Color(0xFFFFFFFF),
      letterSpacing: 0,
    ),
    this.h4 = const TextStyle(
      fontSize: 8,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      height: 27 / 17,
      color:   Color(0xFFFFFFFF),
      letterSpacing: 0,
    ),
    this.h5 = const TextStyle(
      fontSize: 5,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      height: 27 / 17,
      color:   Color(0xFFFFFFFF),
      letterSpacing: 0,
    ),

  }) : super();
}

extension ThemeDataExtensions on ThemeData {
  static final Map<InputDecorationTheme, OwnThemeFields> _own = {};

  void addOwn(OwnThemeFields own) {
    _own[inputDecorationTheme] = own;
  }

  static OwnThemeFields? empty;

  OwnThemeFields own() {
    var o = _own[inputDecorationTheme];
    if (o == null) {
      empty ??= OwnThemeFields();
      o = empty;
    }
    return o!;
  }
}

OwnThemeFields ownTheme(BuildContext context) => Theme.of(context).own();


final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
   // scaffoldBackgroundColor: FigmaColors.white,
    brightness: Brightness.light,

    primaryColor: const  Color(0xFF0F1320),
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }))
  ..addOwn(
    OwnThemeFields(),
  );