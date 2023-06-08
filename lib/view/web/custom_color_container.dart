import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components.dart';
import '../widgets/widgets.dart';
import 'bottom_custom_widget.dart';
import 'top_custom_container.dart';

class CustomColorContainer extends StatelessWidget {
  const CustomColorContainer({Key? key}) : super(key: key);

  Size size(BuildContext context) => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
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
            left: size(context).width/5.5,
            bottom: size(context).width/22,
            child: const MiddleCardWidget()),
        Align(
            alignment: Alignment.bottomCenter,
            child:BottomWidget(
              borderTopRight: MediaQuery.of(context).size.height/10,
              height:  MediaQuery.of(context).size.height/15,
            child: const BottomChildWeb(),)),
        const TopCustomContainer(),
      ],
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({Key? key}) : super(key: key);


  Size size(BuildContext context) => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {

    Widget assetSocialLMedia(String asset,double height){
      return Padding(
        padding:  EdgeInsets.all(size(context).height/100),
        child: SvgPicture.asset(asset,
          height: size(context).height/40,),
      );
    }
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        assetSocialLMedia("assets/vector/vectorSocialMedia.svg",
          size(context).height/40,),
        assetSocialLMedia("assets/vector/facebook.svg",
          size(context).height/40,),
        assetSocialLMedia("assets/vector/github.svg",
          size(context).height/40,),
        assetSocialLMedia("assets/vector/instagram.svg",
          size(context).height/40,),
        assetSocialLMedia("assets/vector/reddit.svg",
          size(context).height/40,),
        assetSocialLMedia("assets/vector/medium.svg",
          size(context).height/40,),
      ],
    ); 
  }
}


class BottomChildWeb extends StatelessWidget {
  const BottomChildWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LogoName(imageHeight: MediaQuery.of(context).size.height/30,
          textSize: MediaQuery.of(context).size.height/80,),
        const SocialMediaIcon(),
         Padding(
           padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height/80),
           child: MausamAppText(text:
        '© 2023 Mausam. All rights reserved.'
            ,color: const  Color(0xFFFFFFFF),fontSize:  MediaQuery.of(context).size.height/80,),
         )
      ],
    );
  }
}


class MiddleCardWidget extends StatelessWidget {
  const MiddleCardWidget({Key? key}) : super(key: key);

  Size sizes(BuildContext context) => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {

    Widget card(String time){
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),

        color:const Color(0xFFFFFFFF),
        elevation: sizes(context).height/52,
        child: Container(
          decoration: BoxDecoration(
            gradient:  const LinearGradient(
                begin:  Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [
                  //   0.01,
                  0.1,
                  0.6,
                  0.9,
                ],
                colors: [
                  // Color(0xFFFFFFFF),
                  Color(0xFF808080),
                  Color(0xFF5A5A5A),
                  Color(0xFF0F1320),


                ]
            ),
            borderRadius: BorderRadius.circular(15.0),

          ),
          width: 60,
          height: 90,
          child: Padding(
            padding:   EdgeInsets.all(sizes(context).height/50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MausamAppText(text: time,
                  color:  const Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/82,fontWeight: FontWeight.bold,),
                SizedBox(
                  height: sizes(context).height/300,
                ),
                const Icon(Icons.sunny,size: 10,color:Color(0xFFFFFFFF),),
                SizedBox(
                  height: sizes(context).width/300,
                ),
                MausamAppText(text: '34 C',
                  color: const  Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/52,
                  fontWeight: FontWeight.bold,)
              ],
            ),
          ),
        ),
      );
    }

    return  Container(
      width: MediaQuery.of(context).size.width/1.5,
      height:  MediaQuery.of(context).size.height/4.5,
      decoration:    BoxDecoration(
        gradient:  const LinearGradient(
            begin:  Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [

              Color(0xFF0F1320),
              Color(0xFF2B3087),
              Color(0xFF00B4EC),
              Color(0xFF0F1320),
              Color(0xFF0F1320)
            ]
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
              MediaQuery.of(context).size.height/50),
        ),
        color: const Color(0xFF0F1320),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
          MausamAppText(text: 'Thunderstorms from 3pm-8pm, with mostly clear conditions expected at 8pm.',
            color: const  Color(0xFFFFFFFF),
            fontSize: sizes(context).height/52,
            fontWeight: FontWeight.bold,),
          SizedBox(
            width: sizes(context).width/1.7,
            height: sizes(context).height/7,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card('Now'),
                card('4PM'),
                card('5PM'),
                card('6PM'),
                card('7PM'),
                card('8PM'),
                card('9PM'),
                card('10PM'),
                card('11PM'),
                card('12PM'),
                card('1PM'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

