import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc_calculador/components/calculator.dart';
import 'package:imc_calculador/components/header_imc.dart';
import 'package:imc_calculador/core/appcolor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header de fondo
          const Column(children: [HeaderIMC()]),

          // Sombra del card
          Positioned(
            top: 0.23.sh, // posición proporcional
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 0.6.sh, // altura proporcional
              width: 1.sw,
              child: CustomPaint(painter: ShadowCardPainter()),
            ),
          ),

          // Card con contenido
          Positioned(
            top: 0.25.sh,
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 0.6.sh,
              width: 1.sw,
              child: ClipPath(
                clipper: MyCustomCard(),
                child: Container(
                  color: AppColors.background,
                  child: const Calculator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✨ Clipper del Card
class MyCustomCard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height * 0.08);

    // Curvas izquierdas
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.08,
      size.width * 0.05,
      size.height * 0.05,
    );
    path.quadraticBezierTo(size.width * 0.05, 0, size.width * 0.2, 0);

    // Línea superior
    path.lineTo(size.width * 0.8, 0);

    // Curvas derechas
    path.quadraticBezierTo(
      size.width * 0.95,
      0,
      size.width * 0.95,
      size.height * 0.05,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.08,
      size.width,
      size.height * 0.08,
    );

    // Lados e inferior
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

// ✨ Sombra del Card
class ShadowCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(0, size.height * 0.08);
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.08,
      size.width * 0.05,
      size.height * 0.05,
    );
    path.quadraticBezierTo(size.width * 0.05, 0, size.width * 0.2, 0);
    path.lineTo(size.width * 0.8, 0);
    path.quadraticBezierTo(
      size.width * 0.95,
      0,
      size.width * 0.95,
      size.height * 0.05,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.08,
      size.width,
      size.height * 0.08,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 8, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
