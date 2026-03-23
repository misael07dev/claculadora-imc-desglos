import 'package:flutter/material.dart';
import 'package:imc_calculador/components/calculator.dart';
import 'package:imc_calculador/components/header_imc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Header de fondo
          Column(children: const [HeaderIMC()]),

          //sombra de card
          Positioned(
            top: screenHeight * 0.19,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight,
              width: double.infinity,
              child: CustomPaint(painter: ShadowCardPainter()),
            ),
          ),
          Positioned(
            top: screenHeight * 0.21,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyCustomCard(),
                    child: Container(
                      height: screenHeight,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Container(child: Calculator()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomCard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // 1️⃣ Punto inicial
    path.moveTo(size.width * 0.0, size.height * 0.08);

    // 2️⃣ Curvas izquierdas
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.08,
      size.width * 0.05,
      size.height * 0.05,
    );

    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.0,
      size.width * 0.2,
      size.height * 0.0,
    );

    // 3️⃣ Línea superior
    path.lineTo(size.width * 0.8, size.height * 0.0);

    // 4️⃣ Curvas derechas
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.0,
      size.width * 0.95,
      size.height * 0.05,
    );

    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.08,
      size.width * 1.0,
      size.height * 0.08,
    );

    // 5️⃣ Lados e inferior
    path.lineTo(size.width * 1.0, size.height * 1.0);
    path.lineTo(size.width * 0.0, size.height * 1.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ShadowCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    // 1️⃣ Punto inicial
    path.moveTo(size.width * 0.0, size.height * 0.08);

    // 2️⃣ Curvas izquierdas
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.08,
      size.width * 0.05,
      size.height * 0.05,
    );

    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.0,
      size.width * 0.2,
      size.height * 0.0,
    );

    // 3️⃣ Línea superior
    path.lineTo(size.width * 0.8, size.height * 0.0);

    // 4️⃣ Curvas derechas
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.0,
      size.width * 0.95,
      size.height * 0.05,
    );

    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.08,
      size.width * 1.0,
      size.height * 0.08,
    );

    // 5️⃣ Lados e inferior
    path.lineTo(size.width * 1.0, size.height * 1.0);
    path.lineTo(size.width * 0.0, size.height * 1.0);

    path.close();

    canvas.drawShadow(path, Colors.black, 8, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
