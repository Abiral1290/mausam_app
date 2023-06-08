
import 'package:flutter/material.dart';
import 'dart:ui'as ui;









class DrawLine extends CustomPainter {

  BuildContext? context;

   DrawLine({this.context});

  @override
  void paint(Canvas canvas,   size) {


    Size sizes(BuildContext context) => MediaQuery.of(context).size;



    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(sizes(context!).width/9,  size.height /6);
    path.lineTo(sizes(context!).width/8,  size.height /4);
    path.lineTo(sizes(context!).width/25,  size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, Paint()..color =const  Color(0xFF00B4EC));

    var path1 = Path();
    path1.moveTo(sizes(context!).width/8, size.height /4);
    path1.lineTo(sizes(context!).width / 50, size.height);
    path1.lineTo(sizes(context!).width/4, size.height);
    path1.close();
    canvas.drawPath(path1, Paint()..shader = ui.Gradient.linear(
       const ui.Offset(0.1,1),
     const ui.Offset(0.1,1),
      [
        Colors.green,
        Colors.lightGreenAccent,
      ],
    ));

    var path2 = Path();
    path2.moveTo(sizes(context!).width/9,size.height /6);
    path2.lineTo(sizes(context!).width / 5,size.height /6);
    path2.lineTo(sizes(context!).width/3, size.height);
    path2.lineTo(sizes(context!).width/4, size.height);
    path2.close();
    final paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 4;
    canvas.drawPath( path2 ,paint);
    //
    var path3 = Path();
    path3.moveTo(sizes(context!).width / 5,size.height /6);
    path3.lineTo(sizes(context!).width / 2,size.height /6);
    path3.lineTo(sizes(context!).width/3.15 , size.height/1.1);
    // path2.lineTo(sizes(context!).width, size.height);
    path3.close();
    final paint1 = Paint()
      ..color = Colors.green
      ..strokeWidth = 4;
    canvas.drawPath( path3 ,paint1);
    //
    var path4 = Path();
    path4.moveTo(sizes(context!).width / 2,size.height /6);
    path4.lineTo(sizes(context!).width / 1.6,size.height /6);
    path4.lineTo(sizes(context!).width/2.5, size.height);
    path4.lineTo(sizes(context!).width/3.5, size.height);
    // path2.lineTo(sizes(context!).width, size.height);
    path4.close();
    final paint2 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4;
    canvas.drawPath( path4 ,paint2);
    //
    var path5 = Path();
    path5.moveTo(sizes(context!).width / 1.6,size.height /6);
    path5.lineTo(sizes(context!).width / 1.5,size.height /6);
    path5.lineTo(sizes(context!).width/1.1, size.height);
    path5.lineTo(sizes(context!).width/2.5, size.height);

    path5.close();
    final paint3 = Paint()
      ..color = Colors.lightBlue
      ..strokeWidth = 4;
    canvas.drawPath( path5 ,paint3);



    var path6 = Path();
    path6.moveTo(sizes(context!).width / 1.5,size.height /6);
    path6.lineTo(sizes(context!).width,size.height /6);
    path6.lineTo(sizes(context!).width, size.height);
    path6.lineTo(sizes(context!).width/1.1, size.height);
    // path2.lineTo(sizes(context!).width, size.height);
    path6.close();
    final paint4 = Paint()
      ..color = Colors.red
      ..strokeWidth = 4;
    canvas.drawPath( path6 ,paint4);


    var paint5 = Paint()
      ..color =const Color(0xff63aa65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    //draw arc
    canvas.drawArc(const Offset(100, 100) & const Size(100, 100),
        2, //radians
        0, //radians
        false,
        paint5);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
