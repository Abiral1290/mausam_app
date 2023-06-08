import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MausamAppText extends StatelessWidget {

  final String text;

  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const MausamAppText({Key? key,
    required this.text,this.fontSize,this.color,
  this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontSize: fontSize,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight,
      color: color,
      height: 48 / 32,
      letterSpacing: 0,
    ),);
  }
}


class MausamAppTextField extends StatelessWidget {
  final String hint;

  const MausamAppTextField({Key? key,required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
          filled: true,
          fillColor:const Color(0x24FFFFFF),
        hintText: hint,
          hintStyle: const TextStyle(fontSize: 10),
          prefixIcon: const Icon(Icons.search,size: 15,)
      ),
    );
  }
}

class ImageAsset extends StatelessWidget {
  const ImageAsset({Key? key}) : super(key: key);


  Size sizes(BuildContext context) => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: sizes(context).height/25,
        // ),
        CircleAvatar(
          backgroundImage: const AssetImage(
            "assets/asset/Ellipse43.png",
          ),
          backgroundColor: Colors.transparent,
          radius:   sizes(context).height/13,
          child:     SvgPicture.asset("assets/asset/Ellipse42.svg",
            height: MediaQuery.of(context).size.height/10,
          ),
          // child: child,
        ),

      ],
    );
  }
}



class LogoName extends StatelessWidget {
  final double imageHeight;
  final double textSize;

  const LogoName({Key? key,required this.imageHeight,
    required this.textSize}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:   EdgeInsets.all(MediaQuery.of(context).size.width/80),
      child: Row(
        children: [
          SvgPicture.asset("assets/asset/Group3.svg",
            height: imageHeight,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/100,
          ),
          MausamAppText(
            text: 'Mausam',
            color:   const Color(0xFFFFFFFF),
            fontSize: textSize,fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {

  const CustomCard({Key? key}) : super(key: key);

  Size sizes(BuildContext context) => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
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
            children: <Widget>[

              MausamAppText(text: '',
                color: const  Color(0xFFFFFFFF),
                fontSize: sizes(context).height/82,fontWeight: FontWeight.bold,),
              SizedBox(
                height: sizes(context).height/300,
              ),
              const Icon(Icons.sunny,size: 10,color:Color(0xFFFFFFFF),),
              SizedBox(
                height: sizes(context).width/300,
              ),
              MausamAppText(text: '34 C',
                color:  const Color(0xFFFFFFFF),
                fontSize: sizes(context).height/52,
                fontWeight: FontWeight.bold,)
            ],
          ),
        ),
      ),
    );
  }
}


class CustomCard1 extends StatelessWidget {
  const CustomCard1({Key? key}) : super(key: key);

  Size sizes(BuildContext context) => MediaQuery.of(context).size;


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 90,
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
                  MausamAppText(text: 'Today',color: const  Color(0xFFFFFFFF),
                    fontSize: sizes(context).height/100,fontWeight: FontWeight.bold,)
                ],
              ),
              SizedBox(
                height: sizes(context).height/300,
              ),
              MausamAppText(text: '34 C',
                color: const  Color(0xFFFFFFFF),
                fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,),
              SizedBox(
                height: sizes(context).width/300,
              ),
              MausamAppText(text: 'L:19 - H:34',
                color: const  Color(0xFFFFFFFF),
                fontSize: sizes(context).height/70,fontWeight: FontWeight.bold,)
            ],
          ),
        ),
      ),
    );
  }
}
