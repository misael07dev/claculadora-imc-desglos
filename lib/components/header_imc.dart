import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imc_calculador/components/image_login.dart';
import 'package:imc_calculador/core/app_text.dart';

class HeaderIMC extends StatelessWidget {
  const HeaderIMC({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.50, // 🔥 ocupa toda la pantalla
      child: Stack(
        children: [
          // 🔵 FONDO REAL (pantalla completa)
          Positioned(
            top: screenHeigth * 0.06, // 10% desde arriba
            left: screenWidth * 0.05, // 5% desde la izquierda
            right: screenWidth * 0.05,
            child: ImageLogin(),
          ),

          // ✂️ HEADER ARRIBA
          Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: SizedBox(
                  height: screenHeigth * 0.12,
                  child: Stack(
                    children: [
                      Container(color: const Color(0xFF126BB4)),

                      CustomPaint(
                        size: Size.infinite,
                        painter: LeftShapePainter(),
                      ),

                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/image/logo.svg",
                              width: 50,
                              height: 30,
                            ),
                            const SizedBox(height: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Calculadora de ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ImcText(
                                  color: Colors.white,
                                  tituloFontSize: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 🔻 ESPACIO RESTANTE
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}

class LeftShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF3B82F6);

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width * 0.5, 0);

    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.4,
      size.width * 0.1,
      size.height * 0.7,
    );

    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.7,
      0,
      size.height * 0.8,
    );

    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
      size.width * 0.01,
      size.height * 0.7,
      size.width * 0.4,
      size.height * 0.8,
    );

    path.quadraticBezierTo(
      size.width * 1,
      size.height * 0.9,
      size.width,
      size.height * 0.6,
    );

    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
