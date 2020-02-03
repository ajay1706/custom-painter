import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
//        width: 600,
//        height: 600,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: LayoutBuilder(builder: (_, constraints) {
        return Container(
            width: constraints.widthConstraints().maxWidth,
            height: constraints.heightConstraints().maxHeight,
            color: Colors.yellow,
            child: CustomPaint(
              painter: Painter(),
            ));
      }),
    ));
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
// define a Paint object

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.indigo;

    final horizontalLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.indigo;

//  final redPaint = Paint()
//  ..style = PaintingStyle.fill
//  ..color= Colors.red;

//  canvas.drawRect(
//  Rect.fromLTWH(20, 40, 100, 100)
//  , paint);

    //left eye
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(20, 250, 100, 100), Radius.circular(10)),
        paint);

    //right eye

    canvas.drawOval(Rect.fromLTWH(size.width - 120, 250, 100, 100), paint);

    //mouth
    final p1 = Offset(-90, 0);
    final p2 = Offset(90, 0);






    final mouth = Path();
    final line = Path();
    line.addRect(Rect.fromLTWH(65, 180, 200, 1));



    mouth.moveTo(size.width*0.8, size.height*0.6);
    
    mouth.arcToPoint(
      Offset(size.width*0.2, size.height*0.6),
      radius: Radius.circular(150)
    );

    mouth.arcToPoint(
        Offset(size.width*0.8, size.height*0.6),
        radius: Radius.circular(200),
      clockwise: false
    );
    canvas.drawPath(mouth,paint);
    canvas.drawPath(line, horizontalLine);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
