import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mausamapp/controller/weatherController.dart';
import 'package:provider/provider.dart';


import '../components.dart';
class TopCustomContainerDetails extends StatelessWidget {
  const TopCustomContainerDetails({Key? key}) : super(key: key);

  Size sizes(BuildContext context) => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {


    Widget cards(){
      return SizedBox(
        width: 75,
        height: 80,
        // padding: new EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: const Color(0xFF171B29),
          elevation: sizes(context).height/52,
          child: Padding(
            padding:   EdgeInsets.all(sizes(context).height/50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/asset/line-md_sunny-outline-loop.svg",
                      height: sizes(context).height/60,
                      width: sizes(context).width/50,
                    ),
                    SizedBox(
                      width: sizes(context).width/200,
                    ),
                    MausamAppText(text: 'Today',color:   const Color(0xFFFFFFFF),
                      fontSize: sizes(context).height/100,fontWeight: FontWeight.bold,)
                  ],
                ),
                SizedBox(
                  height: sizes(context).height/300,
                ),
                MausamAppText(text: '34 C',
                  color:  const Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,),
                SizedBox(
                  height: sizes(context).width/300,
                ),
                MausamAppText(text: 'L:19 - H:34',
                  color:  const Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,)
              ],
            ),
          ),
        ),
      );
    }

    Widget imageAsset(){
      return Consumer<WeatherController>(
        builder: (context,value,child) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: sizes(context).height/20,
              ),
              value.weather != null?
              MausamAppText(text: value.weather!.name.toString(),
                color:  const Color(0xFFFFFFFF),
                fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,):const SizedBox(height: 40,),
              value.weather != null?
              MausamAppText(text: '${(value.weather!.main!.temp!- 273).
              toStringAsFixed(2).toString()}°C',
                color: const  Color(0xFFFFCF24),
                fontSize: sizes(context).height/27,fontWeight: FontWeight.bold,):const SizedBox(height: 40,),
              value.weather != null?
              MausamAppText(text: value.weather!.weather!.first.main!,
                color:  const Color(0xFFFFFFFF),
                fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,):const SizedBox(height: 40,),
              SizedBox(
                height: sizes(context).height/45,
              ),
              value.weather != null?
              CircleAvatar(
                backgroundImage: const AssetImage(
                  "assets/asset/Ellipse43.png",

                ),
                backgroundColor: Colors.transparent,
                radius:   sizes(context).height/12,
                child:     SvgPicture.asset("assets/asset/Ellipse42.svg",
                  height: MediaQuery.of(context).size.height/40,
                ),
                // child: child,
              ):const SizedBox(),

            ],
          );
        }
      );
    }


    Widget logoName(){
      return Padding(
        padding:   EdgeInsets.all(MediaQuery.of(context).size.width/80),
        child: Row(
          children: [
            SvgPicture.asset("assets/asset/Group3.svg",
              height: MediaQuery.of(context).size.height/40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/200,
            ),
            MausamAppText(
              text: 'Mausam',
              color: const  Color(0xFFFFFFFF),
              fontSize: sizes(context).height/52,fontWeight: FontWeight.bold,
            )
          ],
        ),
      );
    }

    Widget dateDay(){
      return Selector<WeatherController, DateTime>(
        selector:(_, provider) => provider.datetime,
        builder: (context,value,child) {
          return Padding(
            padding:   EdgeInsets.all(MediaQuery.of(context).size.width/80),
            child: Column(
              children: [
                MausamAppText(
                  text: DateFormat.MMMd().format(value),
                  color: const  Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/35,fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/200,
                ),
                MausamAppText(
                  text: '${DateFormat.EEEE().format(value)} ${DateTime.now().hour}:${DateTime.now().minute}',
                  color:  const Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,
                )
              ],
            ),
          );
        }
      );
    }
    Widget temperature(String range,String degree,
        double textStyle,FontWeight fontWeight,Color color){
      return Padding(
        padding:   EdgeInsets.all(MediaQuery.of(context).size.width/80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MausamAppText(
              text: range,
              color:  const Color(0xFFFFFFFF),
              fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/200,
            ),
            MausamAppText(
              text: degree,
              fontSize: textStyle,
              fontWeight: fontWeight,
              color: color,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/200,
            ),

          ],
        ),
      );
    }

    return Padding(
      padding:   EdgeInsets.all(MediaQuery.of(context).size.width/80),
      child: SizedBox(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: logoName()
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width:
                  MediaQuery.of(context).size.width/3,
                  height:
                  MediaQuery.of(context).size.height/22,
                  child:const
                  MausamAppTextField(hint: 'Search for place',)),
            ),
            Positioned(
                left: sizes(context).height/9,
                top: sizes(context).height/9,
                child: dateDay()
            ),
            Align(
                alignment: Alignment.center,
                // left: sizes(context).height/2,
                // top: sizes(context).height/9.3,
                child: Column(
                  children: [
                    imageAsset(),
                  ],
                )),
            Align(
              alignment:const Alignment(0.04,-0.13),
              child: Image.asset(
                "assets/asset/unsplash_K-Iog-Bqf8E.png",
                height: sizes(context).height/8,
              ),
            ),
            Positioned(
                left: sizes(context).height/9,
                top: sizes(context).height/4,
                child: temperature('High','30 Celsius',

                  sizes(context).height/35, FontWeight.bold,
                  const Color(0xFFFFCF24),)),
            Positioned(
                top: sizes(context).height/2.9,
                left: sizes(context).height/5.5,
                child: MausamAppText(
                  text: 'Mostly Sunny',
                  color: const  Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,
                )),
            Positioned(
                left: sizes(context).width/1.3,
                top: sizes(context).height/4.3,
                child: temperature('Low','19 Celcius',
                  sizes(context).height/35, FontWeight.bold,
                 const Color(0xFFE20613),)),
            Positioned(
                top: sizes(context).height/3,
                left: sizes(context).width/1.2,
                child: MausamAppText(
                  text: 'Sunny',
                  color:const   Color(0xFFFFFFFF),
                  fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,
                )),
            Positioned(
                top: sizes(context).height/2.8,
                left: sizes(context).width/3.5,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: sizes(context).width/2,
                  ),
                  child: SingleChildScrollView(
                    child: Wrap(
                      //  runSpacing: 0,
                      children: [
                        cards(),
                        cards(),
                        cards(),
                        cards(),
                        cards(),
                        cards(),
                        cards(),
                        cards(),

                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class TopCustomContainer extends StatelessWidget {
  const TopCustomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          height:  MediaQuery.of(context).size.height/1.5,
          decoration: BoxDecoration(
            gradient:const  LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

                colors: [
                  Color(0xFF0F1320),
                  Color(0xFF1b2f4a),
             
                  Color(0xFF0F1320)
                ]
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular( MediaQuery.of(context).size.height/10),
            ),
            color: const Color(0xFF0F1320),
          ),
          child:const TopCustomContainerDetails(),
        ),
        SvgPicture.asset("assets/vector/Vector.svg",
          height: MediaQuery.of(context).size.height/7,)
      ],
    );
  }
}
