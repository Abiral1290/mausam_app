import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mausamapp/controller/weatherController.dart';
import 'package:mausamapp/view/web/custom_color_container.dart';
import 'package:provider/provider.dart';

import '../components.dart';
import '../web/bottom_custom_widget.dart';
import '../widgets/widgets.dart';

class CustomMainWidgetMobile extends StatelessWidget {
  const CustomMainWidgetMobile({Key? key}) : super(key: key);


  Size size(BuildContext context) => MediaQuery.of(context).size;




  @override
  Widget build(BuildContext context) {




    Widget bottomChild(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoName(imageHeight: size(context).height/30,
            textSize: size(context).height/45,),
          SocialMediaIcon(),
          const MausamAppText(text: '© 2023 Mausam. All rights reserved.',color:  Color(0xFFFFFFFF),)
        ],
      );
    }

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          // top: 200,
          child: CustomPaint(size: Size(size(context).width,
            size(context).height/1,),
            painter: DrawLine(context: context),
          ),
        ),
        Positioned(
          //left: size(context).width/5.5,
          bottom: size(context).width/3.5,
          child: Padding(
            padding:   EdgeInsets.only(left:size(context).height/50,
                top: size(context).height/50),
            child: SizedBox(
              width: size(context).width,
              height: size(context).height/7,
              child: ListView(
                scrollDirection: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                  CustomCard1(),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
            child:  TopContainer()),
        Align(
            alignment: Alignment.bottomCenter,
            child:BottomWidget(borderTopRight: size(context).height/50,
              height:  MediaQuery.of(context).size.height/8,
            child: bottomChild(),)),
      ],
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  Size sizes(BuildContext context) => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:  MediaQuery.of(context).size.height/1.45,
      decoration: BoxDecoration(
        gradient:const  LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              // Color(0xFF00B4EC),
              Color(0xFF2B3087),
              Color(0xFF0F1320)
            ]
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
              MediaQuery.of(context).size.height/40),
        ),
        color: const Color(0xFF0F1320),
      ),
      child: Consumer<WeatherController>(
        builder: (context,value,child) {
          return Column(
            children: [
              SizedBox(height: sizes(context).height/20,),
              Padding(
                padding:   EdgeInsets.only(left:sizes(context).height/30),
                child: LogoName(imageHeight: sizes(context).height/30,
                  textSize: sizes(context).height/45,),
              ),
              SizedBox(height: sizes(context).height/60,),
              Padding(
                padding:EdgeInsets.only(
                    left:sizes(context).height/30,right:sizes(context).height/30),            child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/20,
                    child: const MausamAppTextField(hint: 'Search',)),
              ),
              SizedBox(height: sizes(context).height/50,),
              value.weather != null?
              MausamAppText(text: value.weather!.name.toString(),
                color:  const Color(0xFFFFFFFF),
                fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,):const SizedBox(),
              value.weather != null?
              MausamAppText(text: '${(value.weather!.main!.temp!- 273).
              toStringAsFixed(2).toString()}°C',
                color: const  Color(0xFFFFCF24),
                fontSize: sizes(context).height/27,fontWeight: FontWeight.bold,):const SizedBox(),
              value.weather != null?
              MausamAppText(text: value.weather!.weather!.first.main!,
                color: const  Color(0xFFFFFFFF),
                fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,):const SizedBox(),

              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                      child: Padding(
                        padding:  EdgeInsets.only(left: sizes(context).height/30),
                        child: const ImageAsset(),
                      )),
                  Positioned(
                  //  left: sizes(context).width,
                    top: sizes(context).height/30,
                   //alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/asset/unsplash_K-Iog-Bqf8E.png",
                      height: sizes(context).height/6,
                     // width: sizes(context).width,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:   EdgeInsets.only(left:sizes(context).height/50,
                top: sizes(context).height/50),
                child: MausamAppText(text: 'Thunderstorms from 3pm-8pm, with mostly clear conditions expected at 8pm.',
                  color: const  Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/52,
                  fontWeight: FontWeight.bold,),
              ),
              Padding(
                padding:   EdgeInsets.only(left:sizes(context).height/50,
                    top: sizes(context).height/50),
                child: SizedBox(
                  width: sizes(context).width,
                  height: sizes(context).height/7,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children:const [
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                      CustomCard(),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

