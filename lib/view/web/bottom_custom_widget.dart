
import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {

  final double borderTopRight ;
  final double height;
  final Widget child;

  const BottomWidget({Key? key,required this.borderTopRight,required this.height,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration:    BoxDecoration(
        gradient:  const LinearGradient(
            begin:  Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF00B4EC),
              Color(0xFF0F1320),
              Color(0xFF2B3087),
              Color(0xFF0F1320),

              Color(0xFF0F1320)
            ]
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
              borderTopRight),
        ),
        color:const Color(0xFF0F1320),
      ),
      child: child
    );
  }
}