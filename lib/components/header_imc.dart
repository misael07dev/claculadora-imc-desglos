import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imc_calculador/components/appsvg.dart';

import 'package:imc_calculador/core/app_text.dart';
import 'package:imc_calculador/core/appcolor.dart';

class HeaderIMC extends StatelessWidget {
  const HeaderIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.sh,
      width: 1.sw,
      child: Stack(
        children: [
          // 🌊 Fondo con imagen
          Positioned(
            top: 0.06.sh,
            left: 0.01.sw,
            right: 0.01.sw,
            child: Appsvg(width: 0.9.sw, height: 0.3.sh),
          ),

          // ✂️ Header con degradado + shapes
          Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: SizedBox(
                  height: 0.17.sh,
                  width: 1.sw,
                  child: Stack(
                    children: [
                      // 🎨 Fondo con degradado (en lugar de color sólido)
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [AppColors.primary, AppColors.secondary],
                          ),
                        ),
                      ),

                      // 🎨 Shape lateral con degradado
                      CustomPaint(
                        size: Size.infinite,
                        painter: LeftShapePainter(),
                      ),

                      // 🧠 Contenido centrado
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/image/logo.svg",
                              width: 50.w,
                              height: 30.h,
                            ),
                            SizedBox(height: 2.h),
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
                                  tituloFontSize: 30.sp,
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

              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}

// 🎨 Custom Painter con degradado
class LeftShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.primary, AppColors.secondary],
      ).createShader(rect);

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

// ✂️ Clipper
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
