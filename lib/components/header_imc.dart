import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imc_calculador/components/image_login.dart';
import 'package:imc_calculador/core/app_text.dart';

class HeaderIMC extends StatelessWidget {
  const HeaderIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.sh, // 50% de la altura de la pantalla
      width: 1.sw, // ancho completo
      child: Stack(
        children: [
          // 🌊 Fondo con imagen escalable
          Positioned(
            top: 0.06.sh,
            left: 0.01.sw,
            right: 0.01.sw,
            child: ImageLogin(
              width: 0.9.sw, // ancho proporcional al dispositivo
              height: 0.3.sh, // alto proporcional
            ),
          ),

          // ✂️ ClipPath con logo y textos
          Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: SizedBox(
                  height: 0.17.sh, // un poco más alto que antes
                  width: 1.sw,
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
                              width: 50.w,
                              height: 30.h,
                            ),
                            SizedBox(
                              height: 2.h,
                            ), // espacio mayor entre logo y texto
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Calculadora de ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ImcText(
                                  color: Colors.white,
                                  tituloFontSize: 25.sp,
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

              // Espacio restante
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}

// ✨ Custom Painter
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

// ✨ Clipper
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
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
