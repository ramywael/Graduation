import 'package:flutter/cupertino.dart';

class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height-10);
    var firstStart = Offset(size.width - (size.width / 2) , size.height - 130);
    var firstEnd = Offset(size.width , size.height - 10.0 );

    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 130);
    var secondEnd = Offset(size.width, size.height - 10.0 );

    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }


}