import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class ImcWidget extends StatefulWidget {
  final double? imc;

  const ImcWidget({super.key, this.imc});

  @override
  State<ImcWidget> createState() => _ImcWidgetState();
}

class _ImcWidgetState extends State<ImcWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // ✅ Solo animar si hay valor
    final initialValue = widget.imc ?? 0;

    animation = Tween<double>(
      begin: 0,
      end: initialValue,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    // ❗ Solo iniciar animación si hay IMC real
    if (widget.imc != null) {
      controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant ImcWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.imc != widget.imc) {
      final newValue = widget.imc ?? 0;

      animation = Tween<double>(
        begin: 0,
        end: newValue,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

      // ❗ Solo animar si hay IMC real
      if (widget.imc != null) {
        controller.forward(from: 0);
      } else {
        controller.reset();
      }
    }
  }

  // 🎯 Estado según IMC
  String getEstado(double imc) {
    if (imc < 18.5) return "Bajo";
    if (imc < 25) return "Normal";
    if (imc < 30) return "Sobrepeso";
    return "Obesidad";
  }

  // 🎨 Color según IMC
  Color getColor(double imc) {
    if (imc < 18.5) return Colors.blue;
    if (imc < 25) return Colors.green;
    if (imc < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Estado sin calcular
    if (widget.imc == null) {
      return SizedBox(
        width: 160.w,
        height: 100.h,
        child: Center(
          child: Text(
            "Sin calcular",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ),
      );
    }

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final currentImc = animation.value;

        return SizedBox(
          width: 160.w,
          height: 100.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 45.h,
                  child: CustomPaint(painter: _ImcPainter(imc: currentImc)),
                ),
              ),

              Positioned(
                top: 26.h,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "IMC",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                    ),
                    Text(
                      currentImc.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: getColor(currentImc),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        getEstado(currentImc),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(height: 10.h),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _ImcPainter extends CustomPainter {
  final double imc;

  _ImcPainter({required this.imc});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 10.w;

    final radius = size.width * 0.38;
    final center = Offset(size.width / 2, size.height);

    final rect = Rect.fromCircle(center: center, radius: radius);

    final startAngle = pi;
    final totalSweep = pi;

    final bgPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, startAngle, totalSweep, false, bgPaint);

    final segments = [
      {"color": Colors.blue, "value": 0.2},
      {"color": Colors.green, "value": 0.3},
      {"color": Colors.orange, "value": 0.25},
      {"color": Colors.red, "value": 0.25},
    ];

    double porcentaje = ((imc - 10) / 30).clamp(0.0, 1.0);
    double sweepActual = totalSweep * porcentaje;

    double currentAngle = startAngle;

    for (var segment in segments) {
      final segmentSweep = totalSweep * (segment["value"] as double);

      if (sweepActual <= 0) break;

      final drawSweep = sweepActual > segmentSweep ? segmentSweep : sweepActual;

      final paint = Paint()
        ..color = segment["color"] as Color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      canvas.drawArc(rect, currentAngle, drawSweep, false, paint);

      currentAngle += segmentSweep;
      sweepActual -= drawSweep;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
