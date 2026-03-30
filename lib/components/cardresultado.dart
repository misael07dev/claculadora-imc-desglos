import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc_calculador/components/banner_result.dart';
import 'package:imc_calculador/core/appcolor.dart';
import 'imc_widget.dart';

class Cardresultado extends StatefulWidget {
  final double? imc; // ✅ ahora puede ser null

  const Cardresultado({super.key, this.imc});

  @override
  State<Cardresultado> createState() => _CardresultadoState();
}

class _CardresultadoState extends State<Cardresultado> {
  Color getColor() {
    if (widget.imc == null) return Colors.grey;

    if (widget.imc! < 18.5) {
      return Colors.blue;
    } else if (widget.imc! < 25) {
      return Colors.green;
    } else if (widget.imc! < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getTexto() {
    if (widget.imc == null) return "Sin calcular";

    if (widget.imc! < 18.5) {
      return "Bajo peso";
    } else if (widget.imc! < 25) {
      return "Normal";
    } else if (widget.imc! < 30) {
      return "Sobrepeso";
    } else {
      return "Obesidad";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 225.h,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: const Color.fromARGB(255, 168, 168, 168),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Tu Resultado",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 1.w),

          // WIDGETS CENTRALES
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160.w,
                height: 100.h,
                child: Center(child: ImcWidget(imc: widget.imc)),
              ),

              SizedBox(width: 10.w),

              // WIDGET REFERENCIA
              Container(
                width: 160.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    // Fila 1
                    Expanded(
                      child: Container(
                        color: AppColors.lines,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            _dot(const Color(0xFF2196F3)),
                            SizedBox(width: 8.w),
                            _rowText(
                              "Bajo peso",
                              "<18.5",
                              const Color(0xFF2196F3),
                              39.w,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Fila 2
                    Expanded(
                      child: Container(
                        color: AppColors.background,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            _dot(const Color(0xFF4CAF50)),
                            SizedBox(width: 8.w),
                            _rowText(
                              "Normal",
                              "18.5-24.9",
                              const Color(0xFF4CAF50),
                              30.w,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Fila 3
                    Expanded(
                      child: Container(
                        color: AppColors.lines,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            _dot(const Color(0xFFFF9800)),
                            SizedBox(width: 8.w),
                            _rowText(
                              "Sobrepeso",
                              "25.0-29.9",
                              const Color(0xFFFF9800),
                              11.w,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Fila 4
                    Expanded(
                      child: Container(
                        color: const Color(0xFFFEFEFE),
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            _dot(const Color(0xFFF44336)),
                            SizedBox(width: 8.w),
                            _rowText(
                              "Obesidad",
                              "30.0+",
                              const Color(0xFFF44336),
                              41.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // BANNER RESULTADO
          Container(
            width: 300.w,
            height: 60.h,
            child: BannerResult(imc: widget.imc),
          ),
        ],
      ),
    );
  }

  // 🔹 Widget reutilizable círculo
  Widget _dot(Color color) {
    return Container(
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  // 🔹 Widget reutilizable fila de texto
  Widget _rowText(String title, String range, Color color, double space) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(width: space),
        Text(
          range,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
