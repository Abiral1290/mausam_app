import 'package:flutter/material.dart';
import 'package:mausamapp/utilities/constants.dart';
import 'package:mausamapp/view/web/custom_color_container.dart';
import 'package:mausamapp/view/widgets/widgets.dart';

import 'MobileResponseWidget/custom_main_widget_mobile.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
     // backgroundColor:  Color(0xFF0F1320),
      body:    LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return const
            CustomColorContainer();
          } else {
            return const  CustomMainWidgetMobile();
          }
        },
      ),
    );
  }
}
