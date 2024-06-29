import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomPaint Example'),
        ),
        body: Center(
          child: CustomPaint(
            size: Size(200, 200),
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintCircle = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final paintTriangle = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    // رسم دایره
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paintCircle,
    );

    // رسم مثلث درون دایره
    final path = Path()
      ..moveTo(size.width / 2, size.height / 4)
      ..lineTo(size.width / 4, 3 * size.height / 4)
      ..lineTo(3 * size.width / 4, 3 * size.height / 4)
      ..close();

    canvas.drawPath(path, paintTriangle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
